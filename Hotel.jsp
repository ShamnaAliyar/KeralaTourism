<%-- 
    Document   : Hotel
    Created on : Sep 16, 2017, 12:20:43 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::Hotel</title>
    </head>
    <body>
          <%
              
               String editId="";
               String hotelname="",locationid="",hoteltypeid="",hoteladdress="",phonenumber="",emailid="";
               if (request.getParameter("eid")!=null)
               {
                String sel="select* from tbl_hotel where hotel_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    hotelname=rs.getString("hotel_name");
                    locationid=rs.getString("location_id");
                    hoteltypeid=rs.getString("hoteltype_id");
                    hoteladdress=rs.getString("hotel_address");
                    phonenumber=rs.getString("hotel_phnno");
                    emailid=rs.getString("hotel_emailid");
                    editId=rs.getString("hotel_id");
                    
                }
            }
     
            if(request.getParameter("did")!=null)
            {
                
                String str="delete from tbl_hotel where hotel_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("Hotel.jsp");
                }
                out.println(b);
            }
            
            
        String submit=request.getParameter("save");
        if(submit!=null)
        {
        String hotelnames=request.getParameter("txthotel");
        String locationname=request.getParameter("location");
        String hoteltypename=request.getParameter("hoteltype");
        String hoteladdres=request.getParameter("txthoteladress");
        String hotelphno=request.getParameter("txtphn");
        String email=request.getParameter("txtemail");
        if(request.getParameter("hid")!="")
                {
                    
                    String up="update tbl_hotel set hotel_name='"+hotelnames+"',location_id='"+locationname+"',hoteltype_id='"+hoteltypename+"',hotel_address='"+hoteladdres+"',hotel_phnno='"+ hotelphno+"',hotel_emailid='"+email+"' where hotel_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("Hotel.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
        String ins="insert into tbl_hotel(hotel_name,location_id,hoteltype_id,hotel_address,hotel_phnno,hotel_emailid)values('"+hotelnames+"','"+locationname+"','"+hoteltypename+"','"+ hoteladdres+"','"+ hotelphno+"','"+email+"')";

        boolean b=obj.insert(ins);
        out.println(ins);
            if(b)
                    response.sendRedirect("Hotel.jsp");
                else
                        {
                            out.print(b);
                        }
                }
       
        
        }
        
        %>
        <form name="frmhotel"><center>
                <input type="hidden" name="hid" value="<%=editId%>">
                <table>
                    <td><h1>Hotel Details</h1></tr>
        <table>
            <tr><td>HotelName</td><td> <input type="text" name="txthotel" id="hotel" value="<%=hotelname%>"></td></tr>
                    <tr><td>Location</td><td>
                    <select name="location" id="sel">
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
                    
                      <tr><td>HotelAddress</td><td> <input type="text" name="txthoteladress" id="hoteladdress" value="<%=hoteladdress%>"></td></tr>
                       <tr><td>Phnno</td><td> <input type="text" name="txtphn" id="phonenumber" value="<%=phonenumber%>"></td></tr> 
                       <tr><td>Hoteltype</td><td>
                    <select name="hoteltype" id="sel2">
                    <option value="select">Select</option>
                                <%
                                    String sel2="select * from tbl_hoteltype";
                                    ResultSet rs2=obj.select(sel2);
                                    while(rs2.next())
                                    {
                                     
                                                                          
                                            
                                     
                                         
                                 %>
                                 <option value="<%=rs2.getString("hoteltype_id")%>" <%if(hoteltypeid.equals(rs2.getString("hoteltype_id"))){%> selected="" <%}%> ><%=rs2.getString("hoteltype_name")%></option>
                                 <%}%>
                                            
                    </select></td></tr>
                    <tr><td>EmailId</td><td> <input type="text" name="txtemail" id="packagerate" value="<%=emailid%>"></td></tr>
                    
                    <tr><td><input type="submit" name="save" value="Save"></td>
                        <td><input type="reset" name="Cancel" value="Cancel">
                </table>
                       <table>
                    
               
                    <tr><td> <h2> <u>Hotel List</u></h2></td></tr>
                    <tr><td>HotelName</td>
                     <td>LocationName</td>
                     <td>HoteltypeName</td>
                     <td>Address</td>
                     <td>Phonenumber</td>
                     <td>EmailId</td>
                       
                    </tr>
                    <%
                       String sel3="select * from tbl_hotel h,tbl_location l,tbl_hoteltype t where h.location_id=l.location_id and h.hoteltype_id=t.hoteltype_id";
                        ResultSet rs11=obj.select(sel3);
                        while(rs11.next())
                        {
                            %>
                    <tr><td><%=rs11.getString("hotel_name")%></td>
                        <td><%=rs11.getString("location_name")%></td>
                        <td><%=rs11.getString("hoteltype_name")%></td>
                        <td><%=rs11.getString("hotel_address")%></td>
                        <td><%=rs11.getString("hotel_phnno")%></td>
                         <td><%=rs11.getString("hotel_emailid")%></td>
                        <td><a href="Hotel.jsp?eid=<%=rs11.getString("hotel_id")%>"> Edit</a></td>
                        <td><a href="Hotel.jsp?did=<%=rs11.getString("hotel_id")%>"> Delete</a></td></tr>
                            
                       <% }%>
                </table>   
            </center></form> 
           </body>
</html>
