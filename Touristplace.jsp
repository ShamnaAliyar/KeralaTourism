<%-- 
    Document   : touristplace
    Created on : Sep 16, 2017, 12:15:45 PM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>  
<html>
    <head>
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::TouristPlace</title>
             </head>
        <body>

            <form name="frm">
            <%
                 String editId="";
              String touristplacename="",locationid="";
                if (request.getParameter("eid")!= null) 
                {
                    String sel = "select * from tbl_touristplace where touristplace_id='" + request.getParameter("eid") + "'";
                    ResultSet rs = obj.select(sel);
                    if (rs.next()) 
                    {
                     locationid=rs.getString("location_id");
                    touristplacename=rs.getString("touristplace_name");
                    editId=rs.getString("touristplace_id");
                    }
                }
                if (request.getParameter("did")!=null) 
                {
                    String str ="delete from tbl_touristplace where touristplace_id='"+request.getParameter("did")+"'";
                    boolean b = obj.insert(str);
                    if (b) 
                    {
                        response.sendRedirect("Touristplace.jsp");
                    }
                    out.println(str);
                }
                String submit = request.getParameter("save");
                if (submit != null) 
                {
                   
                    String location = request.getParameter("locationdetails");
                    String touristplac= request.getParameter("txt_touristplace");

                    if (request.getParameter("hid")!="") 
                    {
                        String up ="update tbl_touristplace set location_id='"+location+"',touristplace_name='"+touristplac+"' where touristplace_id='"+request.getParameter("hid")+"'";

                        boolean b = obj.insert(up);
                        if (b == true) 
                        {
                            //out.println(up);
                            response.sendRedirect("Touristplace.jsp");
                        } else 
                        {
                            out.println(up);
                        }

                    } 
                    else 
                    {

                        String ins = "insert into tbl_touristplace(location_id,touristplace_name)values('"+location+"','"+touristplac+"')";
                        boolean b = obj.insert(ins);
                       if (b == true) 
                       {
                             //out.println(ins);
                            response.sendRedirect("Touristplace.jsp");
                        } else 
                       {
                            out.println(ins);
                        }
                    }
                }
            %>
           <center>
                <input type="hidden" name="hid" value="<%=editId%>">
            <table>
                <tr><h1>Touristplace Details</h1></tr>
                        <tr><td>LocationName</td>
                            <td>
                                <select name="locationdetails" id="locationdetails">
                                    <option value="select">..Select..</option>
                                    <%
                                        String sel="select * from tbl_location";
                                        ResultSet rs=obj.select(sel);
                                        while(rs.next())
                                        {
                                    %>
                                    <option value="<%=rs.getString("location_id")%>"<%if(locationid.equals(rs.getString("location_id"))){%>selected=""<%}%>><%=rs.getString("location_name")%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
            
                <tr><td>TouristPlace</td><td><input type="text" name="txt_touristplace" id="place" value="<%=touristplacename%>"></td></tr>
               <tr><td><input type="submit" name="save" value="Save"></td>
                    <td><input type="reset" value="Cancel" name="cancel"</td>
            </table>
                         <table>
                        <tr><td><u><h2>Location</h2></u></td><td><u><h2>Touristplace</h2></u></td></tr>
                    <%
                         String sell="select * from tbl_touristplace t,tbl_location l where t.location_id=l.location_id";
                                   ResultSet rss=obj.select(sell); 
                                    while(rss.next())
                                    {
                                    
                                %>
                                           <tr><td><%=rss.getString("location_name")%></td>
                                               <td><%=rss.getString("touristplace_name")%> </td>
                                               <td><a href="Touristplace.jsp?eid=<%=rss.getString("touristplace_id")%>">Edit</a></td>
                                               <td><a href="Touristplace.jsp?did=<%=rss.getString("touristplace_id")%>">Delete</a></td>
                                           </tr>
                                <%
                                    }
                    %>
                    
                </table>
                </center>
        </form>
    </body>
</html>
