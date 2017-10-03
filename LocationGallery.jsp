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
     <title>KeralaTourism::Locationgallery</title>

    </head>
    <body>
    <%
              
               String editId="";
               String locationcaption="",locationid="",locationfilename="";
               if (request.getParameter("eid")!=null)
               {
                String sel="select* from tbl_locationgallery where locgal_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    locationcaption=rs.getString("locgal_caption");
                    locationid=rs.getString("location_id");
                   locationfilename=rs.getString("locgal_filename");
                   editId=rs.getString("locgal_id");
                    
                }
            }
     
            if(request.getParameter("did")!=null)
            {
                
                String str="delete from tbl_locationgallery where locgal_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("LocationGallery.jsp");
                }
                out.println(b);
            }
            
            
        String submit=request.getParameter("save");
        if(submit!=null)
        {
        String locationcaptionname=request.getParameter("txtcaptionname");
        String locname=request.getParameter("txtlocationname");
        String filename=request.getParameter("txtfilename");
        if(request.getParameter("hid")!="")
                {
                    
                    String up="update tbl_locationgallery set locgal_caption='"+locationcaptionname+"',location_id='"+locname+"',locgal_filename='"+filename+"' where locgal_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("LocationGallery.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
        String ins="insert into tbl_locationgallery(locgal_caption,location_id,locgal_filename)values('"+locationcaptionname+"','"+locname+"','"+filename+"')";
        boolean b=obj.insert(ins);
        out.println(ins);
            if(b)
                    response.sendRedirect("LocationGallery.jsp");
                else
                        {
                            out.print(b);
                        }
                }
       
        
        }
        
        %>
        
        
          <form name="frmgal"> <center>
              <input type="hidden" name="hid" value="<%=editId%>">
                <table>
                    <td><h1>Gallery Details</h1></tr>
              <tr><td>Location Name</td><td>
                    <select name="txtlocationname" id="sel">
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
              <tr><td>Caption</td><td> <input type="text" name="txtcaptionname" id="caption" value="<%=locationcaption%>"></td></tr>
              <tr><td>Filename</td><td> <input type="text" name="txtfilename" id="vehiclenumber" value="<%=locationfilename%>"></td></tr>
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
                        String sel2="select * from tbl_locationgallery l,tbl_location d where l.location_id=d.location_id";
                        ResultSet r2=obj.select(sel2);
                        while(r2.next())
                        {
                            %>
                    <tr><td><%=r2.getString("locgal_caption")%></td>
                         <td><%=r2.getString("location_name")%></td>
                        <td><%=r2.getString("locgal_filename")%></td>
                       
                        
                        <td><a href="LocationGallery.jsp?eid=<%=r2.getString("locgal_id")%>"> Edit</a></td>
                        <td><a href="LocationGallery.jsp?did=<%=r2.getString("locgal_id")%>"> Delete</a></td></tr>
                            
                       <% }%>
                </table>   
                
    </center>
                
                </form>     
         </body>
    
</html>
