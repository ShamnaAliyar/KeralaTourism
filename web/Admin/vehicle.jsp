<%-- 
    Document   : Vechile
    Created on : Sep 16, 2017, 12:18:16 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean> 
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::Vehicle Details</title>
    </head>
    <body>
      
              <%
              
               String editId="";
               String vehiclename="",vehicletypeid="",vehiclenumber="";
               if (request.getParameter("eid")!=null)
               {
                String sel="select* from tbl_vehicle where vehicle_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    vehicletypeid=rs.getString("vehicleype_id");
                    vehiclename=rs.getString("vehicle_name");
                    vehiclenumber=rs.getString("vehicle_no_seats");
                     editId=rs.getString("vehicle_id");
                    
                }
            }
     
            if(request.getParameter("did")!=null)
            {
                
                String str="delete from tbl_vehicle where vehicle_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("vehicle.jsp");
                }
                out.println(b);
            }
            
            
        String submit=request.getParameter("save");
        if(submit!=null)
        {
        String vehiclenamee=request.getParameter("txtvehiclename");
        String vehicletypename=request.getParameter("vehicletypename");
        String number=request.getParameter("txtvehiclenumber");
         if(request.getParameter("hid")!="")
                {
                    
                    String up="update tbl_vehicle set vehicle_name='"+vehiclenamee+"',vehicletype_id='"+vehicletypename+"',vehicle_no_seats='"+number+"' where vehicle_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("vehicle.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
        String ins="insert into tbl_vehicle(vehicle_name,vehicletype_id,vehicle_no_seats)values('"+vehiclenamee+"','"+vehicletypename+"','"+number+"')";
        boolean b=obj.insert(ins);
        out.println(ins);
            if(b)
                    response.sendRedirect("vehicle.jsp");
                else
                        {
                            out.print(b);
                        }
                }
       
        
        }
        
        %>
            <center>

          <form name="frmvehicle">
              <input type="hidden" name="hid" value="<%=editId%>">
                <table>
                    <td><h1>vehicle Details</h1></tr>
              <tr><td>vehicle Type name</td><td>
                    <select name="vehicletypename" id="sel">
                    <option value="select">Select</option>
                                <%
                                    String sel="select * from tbl_vehicletype";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                     
                                     %>
                                 <option value="<%=rs.getString("vehicletype_id")%>" <%if(vehicletypeid.equals(rs.getString("vehicletype_id"))){%> selected="" <%}%> ><%=rs.getString("vehicletype_name")%></option>
                                 <%}%>
                                            
                              </select></td></tr>
                    <tr><td>Vehicle name</td><td> <input type="text" name="txtvehiclename" id="vehicle"value="<%=vehiclename%>"></td></tr>
                    <tr><td>Number of seats</td><td> <input type="text" name="txtvehiclenumber" id="vehiclenumber" value="<%=vehiclenumber%>"></td></tr>
                       <tr><td><input type="submit" name="save" value="Save"></td>
                        <td><input type="reset" name="Cancel" value="Cancel">
 
                </table>
                    <table>
                    
               
                    <tr><td><h2><u>Vehicle List</u></h2></td></tr>
                    <tr><td>VehicleTypeName</td>
                        <td>VehicleName</td>
                        <td>Vehicle No of Seats</td>
                    </tr>
                    <%
                        String sel1="select * from tbl_vehicle v,tbl_vehicletype vt where v.vehicletype_id=vt.vehicletype_id";
                        ResultSet rs1=obj.select(sel1);
                        while(rs1.next())
                        {
                            %>
                    <tr><td><%=rs1.getString("vehicletype_name")%></td>
                        <td><%=rs1.getString("vehicle_name")%></td>
                        <td><%=rs1.getString("vehicle_no_seats")%></td>
                         <td><a href="vehicle.jsp?eid=<%=rs1.getString("vehicle_id")%>"> Edit</a></td>
                        <td><a href="vehicle.jsp?did=<%=rs1.getString("vehicle_id")%>"> Delete</a></td></tr>
                            
                       <% }%>
                </table>   
    </center>
         </body>
        
                
</html>
