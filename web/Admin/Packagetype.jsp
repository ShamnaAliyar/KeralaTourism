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
        <title>KeralaTourism::PackageType</title>
         <script>
            function validation()
            {
                var dist=document.getElementById("txt_packagetypename");
                if(dist==""){
                    alert("Enter the package type name");
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
             String packagename="";
             if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_packagetype where packagetype_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    packagename=rs.getString("packagetype_name");
                    editId=rs.getString("packagetype_id");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String str="delete from tbl_packagetype where packagetype_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("Packagetype.jsp");
                }
                out.println(b);
            }
            String submit=request.getParameter("save");
            if(submit!=null){
                String packagetype=request.getParameter("txt_packagetypename");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_packagetype set packagetype_name='"+packagetype+"' where packagetype_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("Packagetype.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
                String ins="insert into tbl_packagetype(packagetype_name)values('"+packagetype+"')";
                boolean b=obj.insert(ins);
                out.println(ins);
                 if(b)
                    response.sendRedirect("Packagetype.jsp");
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
                <tr><h1>PACKAGE TYPE</h1></tr>
                 <tr><td>PackageType</td><td><input type="text" name="txt_packagetypename" value="<%=packagename%>" id="packagetypename"></td></tr>
                 <input type="hidden" name="hid" value="<%=editId%>">
                <tr><td><input type="submit" name="save" value="Save" onClick="return validation()"></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
                </tr>
            </table>
                 <table>
                    <tr><td><u><h2>PackageDetails</h2></u></td></tr>
                    <%
                         String sel="select * from tbl_packagetype";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                    
                                %>
                    <tr><td><%=rs.getString("packagetype_name")%></td>
                        <td><a href="Packagetype.jsp?eid=<%=rs.getString("packagetype_id")%>">Edit</a></td>
                        <td><a href="Packagetype.jsp?did=<%=rs.getString("packagetype_id")%>">Delete</a></td>
                    </tr>
                                <%
                                    }
                    %>
                    
                </table>

                 </body>
</html>
