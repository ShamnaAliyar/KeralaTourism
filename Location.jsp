<%-- 
    Document   : Location
    Created on : Sep 16, 2017, 12:13:50 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::PlaceDetails</title>
         <script>
            function validation()
            {
                var loc=document.getElementById("txt_location");
                if(loc==""){
                    alert("Enter the location name");
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
        <form name="frm">
          <%
              String editId="";
              String locationname="",districtid="";
              if(request.getParameter("eid")!=null)
              {
                  String sel="select * from tbl_location where location_id='"+request.getParameter("eid")+"'";
                  ResultSet rs=obj.select(sel);
                  if(rs.next())
                  {
                     districtid=rs.getString("district_id");
                    locationname=rs.getString("location_name");
                    editId=rs.getString("location_id");
                  }
                  
              }
              if(request.getParameter("did")!=null)
              {
                 String str="delete from tbl_location where location_id='"+request.getParameter("did")+"'"; 
                 boolean b=obj.insert(str);
                 if(b)
                 {
                     response.sendRedirect("Location.jsp");
                 }
                 out.println(b);
              }
              
            String submit=request.getParameter("save");
            if(submit!=null){
                String location=request.getParameter("txt_location");
                String district=request.getParameter("distdetail");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_location set district_id='"+district+"',location_name='"+location+"' where location_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                    if(b==true)
                    {
                      response.sendRedirect("Location.jsp");
                    }
                    else
                    {
                        out.println(up);
                    }
                }
                else
                {
                   String ins="insert into tbl_location(district_id,location_name)values('"+district+"','"+location+"')";
                 boolean b=obj.insert(ins);
                 out.println(ins);
                 if(b==true)
                 {
                    response.sendRedirect("Location.jsp");
                 }
                 else
                 {
                    out.println(b);  
                 }
                
                }
                
                
            }
            
        %>
        
        
            <center>
                <input type="hidden" name="hid" value="<%=editId%>">
            <table>
                <tr><h1>location Details</h1></tr>
                        <tr><td>District Name</td>
                            <td>
                                <select name="distdetail" id="distdetail">
                                    <option value="select">..Select..</option>
                                    <%
                                        String sel="select * from tbl_district";
                                        ResultSet rs=obj.select(sel);
                                        while(rs.next())
                                        {
                                    %>
                                    <option value="<%=rs.getString("district_id")%>"<%if(districtid.equals(rs.getString("district_id"))){%>selected=""<%}%>><%=rs.getString("district_name")%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
            
                <tr><td>Location Name</td><td><input type="text" name="txt_location" id="place" value="<%=locationname%>"></td></tr>
               <tr><td><input type="submit" name="save" value="Save" onClick=return validation()></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
            </table>
                         <table>
                            <tr><td><u><h2>District</h2></u></td><td><u><h2>Location</h2></u></td></tr>
                    <%
                         String sell="select * from tbl_location l,tbl_district d where l.district_id=d.district_id";
                                   ResultSet rss=obj.select(sell); 
                                    while(rss.next())
                                    {
                                    
                                     %>
                             <tr><td><%=rss.getString("district_name")%></td>
                            <td><%=rss.getString("location_name")%></td>
                              <td><a href="Location.jsp?eid=<%=rss.getString("location_id")%>">Edit</a></td>
                                               <td><a href="Location.jsp?did=<%=rss.getString("location_id")%>">Delete</a></td>
                                           </tr>
                                  <%
                                    }
                    %>
                    
                </table>
                </center>
        </form>
    </body>
</html>
