<%-- 
    Document   : Roomtype
    Created on : Sep 16, 2017, 12:21:32 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::RoomDetails</title>
         <script>
            function validatio n()
            {
                var dist=document.getElementById("txt_roomtype");
                if(dist==""){
                    alert("Enter the roomtype");
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
             String roomtype="";
             if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_roomtype where rmtype_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    roomtype=rs.getString("rmtype_name");
                    editId=rs.getString("rmtype_id");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String str="delete from tbl_roomtype where rmtype_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("Roomtype.jsp");
                }
                out.println(b);
            }
            String submit=request.getParameter("save");
            if(submit!=null){
                String room=request.getParameter("txt_roomtype");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_roomtype set rmtype_name='"+room+"' where rmtype_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("Roomtype.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
                String ins="insert into tbl_roomtype(rmtype_name)values('"+room+"')";
                boolean b=obj.insert(ins);
                 if(b)
                    response.sendRedirect("Roomtype.jsp");
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
                <tr><h1>Room Details</h1></tr>
                 <tr><td>Room Type</td><td><input type="text" name="txt_roomtype" value="<%=roomtype%>" id="roomtype"></td></tr>
                 <input type="hidden" name="hid" value="<%=editId%>">
                <tr><td><input type="submit" name="save" value="Save" onClick=return validation()></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
                </tr>
            </table>
                 <table>
                    <tr><td><u><h2>Room List</h2></u></td></tr>
                    <%
                         String sel="select * from tbl_roomtype";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                    
                                %>
                    <tr><td><%=rs.getString("rmtype_name")%></td>
                        <td><a href="Roomtype.jsp?eid=<%=rs.getString("rmtype_id")%>">Edit</a></td>
                        <td><a href="Roomtype.jsp?did=<%=rs.getString("rmtype_id")%>">Delete</a></td>
                    </tr>
                                <%
                                    }
                    %>
                    
                </table>

                 </body>
</html>

