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
        <title>KeralaTourism::CountryDetails</title>
         <script>
            function validation()
            {
                var dist=document.getElementById("txt_countryname");
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
             String countryname="";
             if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_country where country_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    countryname=rs.getString("country_name");
                    editId=rs.getString("country_id");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String str="delete from tbl_country where country_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("Country.jsp");
                }
                out.println(b);
            }
            String submit=request.getParameter("save");
            if(submit!=null){
                String country=request.getParameter("txt_countryname");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_country set country_name='"+country+"' where country_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("Country.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
                String ins="insert into tbl_country(country_name)values('"+country+"')";
                boolean b=obj.insert(ins);
                 if(b)
                    response.sendRedirect("Country.jsp");
                else
                        {
                            out.print(ins);
                        }
                }
            }
            
            
        %>
         <form name="frm">
            <center>
               <table>
                <tr><h1>Country Details</h1></tr>
                 <tr><td>CountryName</td><td><input type="text" name="txt_countryname" value="<%=countryname%>" id="countryname"></td></tr>
                 <input type="hidden" name="hid" value="<%=editId%>">
                <tr><td><input type="submit" name="save" value="Save" onClick="return validation()"></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
                </tr>
            </table>
                 <table>
                    <tr><td><u><h2>Country List</h2></u></td></tr>
                    <%
                         String sel="select * from tbl_country";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                    
                                %>
                    <tr><td><%=rs.getString("country_name")%></td>
                        <td><a href="Country.jsp?eid=<%=rs.getString("country_id")%>">Edit</a></td>
                        <td><a href="Country.jsp?did=<%=rs.getString("country_id")%>">Delete</a></td>
                    </tr>
                                <%
                                    }
                    %>
                    
                </table>

                 </body>
</html>
