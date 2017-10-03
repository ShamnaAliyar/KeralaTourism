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
        <title>KeralaTourism::DistrictDetails</title>
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
             String districtname="";
             if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    districtname=rs.getString("district_name");
                    editId=rs.getString("district_id");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String str="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("District.jsp");
                }
                out.println(b);
            }
            String submit=request.getParameter("save");
            if(submit!=null){
                String district=request.getParameter("txt_districtname");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_district set district_name='"+district+"' where district_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("District.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
                String ins="insert into tbl_district(district_name)values('"+district+"')";
                boolean b=obj.insert(ins);
                 if(b)
                    response.sendRedirect("District.jsp");
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
                <tr><h1>District Details</h1></tr>
                 <tr><td>DistrictName</td><td><input type="text" name="txt_districtname" value="<%=districtname%>" id="districtname"></td></tr>
                 <input type="hidden" name="hid" value="<%=editId%>">
                <tr><td><input type="submit" name="save" value="Save" onClick=return validation()></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
                </tr>
            </table>
                 <table>
                    <tr><td><u><h2>District List</h2></u></td></tr>
                    <%
                         String sel="select * from tbl_district";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                    
                                %>
                    <tr><td><%=rs.getString("district_name")%></td>
                        <td><a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td>
                        <td><a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a></td>
                    </tr>
                                <%
                                    }
                    %>
                    
                </table>

                 </body>
</html>
