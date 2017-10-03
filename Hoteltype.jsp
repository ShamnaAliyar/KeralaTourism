<%-- 
    Document   : Hoteltype
    Created on : Sep 16, 2017, 12:20:24 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::HotelDetails</title>
         <script>
            function validation()
            {
                var dist=document.getElementById("txt_hoteltype");
                if(dist==""){
                    alert("Enter the hoteltype");
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
             String hoteltype="";
             if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_hoteltype where hoteltype_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    hoteltype=rs.getString("hoteltype_name");
                    editId=rs.getString("hoteltype_id");
                }
            }
            if(request.getParameter("did")!=null)
            {
                String str="delete from tbl_hoteltype where hoteltype_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("Hoteltype.jsp");
                }
                out.println(b);
            }
            String submit=request.getParameter("save");
            if(submit!=null){
                String room=request.getParameter("txt_hoteltype");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_hoteltype set hoteltype_name='"+room+"' where hoteltype_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("Hoteltype.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
                String ins="insert into tbl_hoteltype(hoteltype_name)values('"+room+"')";
                boolean b=obj.insert(ins);
                 if(b)
                    response.sendRedirect("Hoteltype.jsp");
                else
                        {
                            out.print(ins);
                        }
                }
            }
            
            
        %>
         <form name="frmhoteltype">
            <center>
               <table>
                <tr><h1>Hotel Details</h1></tr>
                 <tr><td>Hotel Type</td><td><input type="text" name="txt_hoteltype" value="<%=hoteltype%>" id="hoteltype"></td></tr>
                 <input type="hidden" name="hid" value="<%=editId%>">
                <tr><td><input type="submit" name="save" value="Save" onClick=return validation()></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
                </tr>
            </table>
                 <table>
                    <tr><td><u><h2>Hotel List</h2></u></td></tr>
                    <%
                         String sel="select * from tbl_hoteltype";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                    
                                %>
                    <tr><td><%=rs.getString("hoteltype_name")%></td>
                        <td><a href="Hoteltype.jsp?eid=<%=rs.getString("hoteltype_id")%>">Edit</a></td>
                        <td><a href="Hoteltype.jsp?did=<%=rs.getString("hoteltype_id")%>">Delete</a></td>
                    </tr>
                                <%
                                    }
                    %>
                    
                </table>

                 </body>
</html>


