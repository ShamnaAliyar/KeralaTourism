<%-- 
    Document   : LocationGallery
    Created on : Sep 25, 2017, 11:25:53 AM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <center>

          <form name="frmvehicle">
              <input type="hidden" name="hid" value="<%=editId%>">
                <table>
                    <td><h1>Gallery Details</h1></tr>
              <tr><td>Location id</td><td>
                    <select name="locationid" id="sel">
                    <option value="select">Select</option>
                                <%
                                    String sel="select * from tbl_location";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                     
                                     %>
                                 <option value="<%=rs.getString("location_id")%>" <%if(locationid.equals(rs.getString("location_id"))){%> selected="" <%}%> ><%=rs.getString("location_name")%></option>
                                 <%}%>
                                            
                              </select></td></tr>
                    <tr><td>Caption</td><td> <input type="text" name="txtcaptionname" id="caption"value="<%=captionname%>"></td></tr>
                    <tr><td>Filename</td><td> <input type="text" name="txtfilename" id="vehiclenumber" value="<%=filename%>"></td></tr>
                       <tr><td><input type="submit" name="save" value="Save"></td>
                        <td><input type="reset" name="Cancel" value="Cancel">
 
                </table>
                    <table>
                    
               
                    <tr><td><h2><u>Gallery List</u></h2></td></tr>
                    <tr><td>Location</td>
                        <td>Caption</td>
                        <td>Filename</td>
                    </tr>
                    <%
                        String sel1="select * from tbl_loationgallery lg,tbl_locatioe l where lg.location_id=l.loaction_id";
                        ResultSet rs1=obj.select(sel1);
                        while(rs1.next())
                        {
                            %>
                    <tr><td><%=rs1.getString("loaction_name")%></td>
                        <td><%=rs1.getString("loggal_caption")%></td>
                        <td><%=rs1.getString("vehicle_no_seats")%></td>
                         <td><a href="LocationGallery.jsp?eid=<%=rs1.getString("vehicle_id")%>"> Edit</a></td>
                        <td><a href="LocationGallery.jsp?did=<%=rs1.getString("vehicle_id")%>"> Delete</a></td></tr>
                            
                       <% }%>
                </table>   
    </center>
         </body>
    </body>
</html>
