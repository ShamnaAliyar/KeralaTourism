<%-- 
    Document   : Hotelrate
    Created on : Sep 16, 2017, 12:21:14 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::HotelRate</title>
    </head>
    <body>
           <form name="frmhotelrate">
            <%
                 String editId="";
              String hotelrate="",roomtypeid="",hotelrateamount="";
                if (request.getParameter("eid")!= null) 
                {
                    String sel = "select * from tbl_hotelrate where hotelrate_id='" + request.getParameter("eid") + "'";
                    ResultSet rs = obj.select(sel);
                    if (rs.next()) 
                    {
                     hotelrate=rs.getString("hotel_id");
                    roomtypeid=rs.getString("rmtype_id");
                    hotelrateamount=rs.getString("hotelrate_amount");
                    editId=rs.getString("hotelrate_id");
                    }
                }
                if (request.getParameter("did")!=null) 
                {
                    String str ="delete from tbl_hotelrate where hotelrate_id='"+request.getParameter("did")+"'";
                    boolean b = obj.insert(str);
                    if (b) 
                    {
                        response.sendRedirect("Hotelrate.jsp");
                    }
                    out.println(str);
                }
                String submit = request.getParameter("save");
                if (submit != null) 
                {
                   
                    String hotelid = request.getParameter("hotelid");
                    String roomtype=request.getParameter("roomtypeid");
                    String hotelrates=request.getParameter("txthotelamount");

                    if (request.getParameter("hid")!="") 
                    {
                        String up ="update tbl_hotelrate set hotel_id='"+hotelid+"',rmtype_id='"+roomtype+"',hotelrate_amount='"+hotelrates+"' where hotelrate_id='"+request.getParameter("hid")+"'";

                        boolean b = obj.insert(up);
                        if (b == true) 
                        {
                            out.println(up);
                            response.sendRedirect("Hotelrate.jsp");
                        } else 
                        {
                            out.println(up);
                        }

                    } 
                    else 
                    {

                        String ins = "insert into tbl_hotelrate(hotel_id,rmtype_id,hotelrate_amount)values('"+hotelid+"','"+roomtype+"','"+hotelrates+"')";
                        boolean b = obj.insert(ins);
                       if (b == true) 
                       {
                             //out.println(ins);
                            response.sendRedirect("Hotelrate.jsp");
                        } else 
                       {
                            out.println(ins);
                        }
                    }
                }
            %>
             <form name="frmhotelrate"><center>
                <input type="hidden" name="hid" value="<%=editId%>">
                 <table>
                   <td><h1>HotelRate Details</h1></tr>
                     <tr><td>Hotel id</td><td>
                    <select name="hotelid" id="sel">
                    <option value="select">Select</option>
                                <%
                                    String sel="select * from tbl_hotel";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                     
                                     %>
                                 <option value="<%=rs.getString("hotel_id")%>" <%if(hotelrate.equals(rs.getString("hotel_id"))){%> selected="" <%}%> ><%=rs.getString("hotel_name")%></option>
                                 <%}%>
                                              </select></td></tr>
         <tr><td>RoomType id</td><td>
                    <select name="roomtypeid" id="sel1">
                    <option value="select">Select</option>
                                <%
                                    String sel1="select * from tbl_roomtype";
                                    ResultSet rs1=obj.select(sel1);
                                    while(rs1.next())
                                    {
                                     
                                     %>
                                 <option value="<%=rs1.getString("rmtype_id")%>" <%if(roomtypeid.equals(rs1.getString("rmtype_id"))){%> selected="" <%}%> ><%=rs1.getString("rmtype_name")%></option>
                                 <%}%>
                                              </select></td></tr>
          <tr><td>HotelRateAmount</td><td> <input type="text" name="txthotelamount" id="hotel" value="<%=hotelrateamount%>"></td></tr>
          
                 <tr><td><input type="submit" name="save" value="Save"></td>
                  <td><input type="reset" name="Cancel" value="Cancel"> 
                 </table>
           <table>
                    
               
                    <tr><td> <h2> <u>HotelRate List</u></h2></td></tr>
                    <tr><td>HotelName</td>
                     <td>RoomType</td>
                     <td>Amount</td>
                     
                       
                    </tr>
                    <%
                       String sel3="select * from tbl_hotelrate hr,tbl_hotel h,tbl_roomtype r where hr.hotel_id=h.hotel_id and hr.rmtype_id=r.rmtype_id";
                        ResultSet rs11=obj.select(sel3);
                        while(rs11.next())
                        {
                            %>
                    <tr><td><%=rs11.getString("hotel_name")%></td>
                        <td><%=rs11.getString("rmtype_name")%></td>
                        <td><%=rs11.getString("hotelrate_amount")%></td>
                       <td><a href="Hotelrate.jsp?eid=<%=rs11.getString("hotelrate_id")%>"> Edit</a></td>
                        <td><a href="Hotelrate.jsp?did=<%=rs11.getString("hotelrate_id")%>"> Delete</a></td></tr>
                            
                       <% }%>
                </table>   
            </center></form>
    </body>
    
      
   
       
</html>
