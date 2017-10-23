<%-- 
    Document   : District
    Created on : Sep 16, 2017, 12:14:13 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::CityDetails</title>
         <script>
            function validation()
            {
                var dist=document.getElementById("txt_district name");
                if(dist==""){
                    alert("Enter the district name");
                    return false;
                }
                else
                {
                    alert("Success");
                    return true;
                }
            }
        </script>
   
    </head>
    <body>
       
                <%
                    
             String editId="";
             String countryid="",cityname="";
             if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_city where city_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    countryid=rs.getString("country_id");
                    cityname=rs.getString("city_name");
                    editId=rs.getString("city_id");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String str="delete from tbl_city where city_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("City.jsp");
                }
                out.println(b);
            }
            String submit=request.getParameter("save");
            if(submit!=null){
                String countryname=request.getParameter("countryname");
                String cityyname=request.getParameter("txt_cityname");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_city set country_id='"+countryname+"',city_name='"+cityyname+"' where city_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("City.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
                String ins="insert into tbl_city(country_id,city_name)values('"+countryname+"','"+cityyname+"')";
                boolean b=obj.insert(ins);
                 if(b)
                    response.sendRedirect("City.jsp");
                else
                        {
                            out.print(ins);
                        }
                }
            }
            
            
        %>
         <form name="frm">
               <center>
               <input type="hidden" name="hid" value="<%=editId%>">
          
               <table>
                <tr><h1>City Details</h1></tr>
               <tr><td>CountryName</td><td>
                    <select name="countryname" id="sel">
                    <option value="select">Select</option>
                                <%
                                    String sel="select * from tbl_country";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                     
                                                                          
                                     %>
                                 <option value="<%=rs.getString("country_id")%>" <%if(countryid.equals(rs.getString("country_id"))){     %> selected="" <%}%> ><%=rs.getString("country_name")%></option>
                                 <%}%>
                                            
                    </select></td></tr>
                <tr><td> City Name :</td>
                  <td> <input type="text" name="txt_cityname" id="cityname"></td></tr>
                 <tr><td><input type="submit" name="save" value="Save"></td>
                        <td><input type="reset" name="Cancel" value="Cancel">
               </table>
                    <table>
                    
               
                    <tr><td><h2><u>City List</u></h2></td></tr>
                    <tr><td><u><h2>CountryName</h2></u></td>    
                         <td><u><h2>CityName</h2></u></td></tr>
                    <%
                       String sel1="select * from tbl_city l,tbl_country d where l.country_id=d.country_id";
                                    ResultSet rr=obj.select(sel1);
                                    while(rr.next())
                                    {
                                    
                                %>
                    <tr><td><%=rr.getString("country_name")%></td>
                        <td><%=rr.getString("city_name")%></td>
                        <td><a href="City.jsp?eid=<%=rr.getString("city_id")%>">Edit</a></td>
                        <td><a href="City.jsp?did=<%=rr.getString("city_id")%>">Delete</a></td>
                    </tr>
                       <% }%>
                </table>                 
                 
                  
              </center>
          </form>
    </body>
          
                

</html>
