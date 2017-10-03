<%-- 
    Document   : Login
    Created on : Sep 16, 2017, 11:50:49 AM
    Author     : student3
--%>
<%@include file="LoginHeader.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::Login</title>
    </head>
    
<%
    
     if(request.getParameter("btnSubmit")!=null)
            {
                out.print("hello");
                
                 String userName=request.getParameter("txtUserName");
                 String userPassword=request.getParameter("txtPassword");
                  
                String sel="select * from tbl_login where login_username='"+userName+"' and login_password='"+userPassword+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                   response.sendRedirect("../Admin/HomePage.jsp");
                }
                else
                {
                    
                }
                
            }
    
    
    %>
    
    <body>
        <br><br><br>
        <form name="frmLogin">
        <table align="center">
            <tr>
                <td>UserName</td>
                <td>
                    <input type="text" name="txtUserName" >
                </td>
            </tr>
             <tr>
                <td>Password</td>
                <td>
                    <input type="password" name="txtPassword" >
                </td>
            </tr>
             <tr>
                 <td colspan="2" align="center">
                     <input type="submit" name="btnSubmit" value="Login">
                 </td>
       
            </tr>
        </table>
        </form>
    </body>
</html>
<%@include file="LoginFooter.jsp"%>