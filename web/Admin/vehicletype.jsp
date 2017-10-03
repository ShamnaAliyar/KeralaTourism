<%-- 
    Document   : Vechiletype
    Created on : Sep 16, 2017, 12:16:15 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISTRICT DETAILS</title>
         <script>
            function validation()
            {
                var dist=document.getElementById("txt_vehicletype_name");
                if(dist==""){
                    alert("Enter the vehicletype");
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
             String vechiletypename="";
             if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_vehicletype where vehicletype_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    vechiletypename=rs.getString("vehicletype_name");
                    editId=rs.getString("vehicletype_id");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String str="delete from tbl_vehicletype where vehicletype_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("vehicletype.jsp");
                }
                out.println(b);
            }
            String submit=request.getParameter("save");
            if(submit!=null){
                String vehicle=request.getParameter("txt_vehicletype_name");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_vehicletype set vehicletype_name='"+vehicle+"' where vehicletype_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("vehicletype.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
                String ins="insert into tbl_vehicletype(vehicletype_name)values('"+vehicle+"')";
                boolean b=obj.insert(ins);
                 if(b)
                    response.sendRedirect("vehicletype.jsp");
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
                <tr><h1>VechicleDetails</h1></tr>
                 <tr><td>VehicleType</td><td><input type="text" name="txt_vehicletype_name" value="<%=vechiletypename%>" id="vehicletypename"></td></tr>
                 <input type="hidden" name="hid" value="<%=editId%>">
                <tr><td><input type="submit" name="save" value="Save" onClick=return validation()></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
                </tr>
            </table>
                 <table>
                    <tr><td><u><h2>VehicleList</h2></u></td></tr>
                    
                    
                    <%
                         String sel="select * from tbl_vehicletype";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                    
                                %>
                    <tr><td><%=rs.getString("vehicletype_name")%></td>
                        <td><a href="vehicletype.jsp?eid=<%=rs.getString("vehicletype_id")%>">Edit</a></td>
                        <td><a href="vehicletype.jsp?did=<%=rs.getString("vehicletype_id")%>">Delete</a></td>
                    </tr>
                                <%
                                    }
                    %>
                    
                </table>

                 </body>
</html>
