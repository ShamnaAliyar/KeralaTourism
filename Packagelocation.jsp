<%-- 
    Document   : PlaceDetails
    Created on : Aug 12, 2017, 10:12:12 AM
    Author     : student3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KeralaTourism::PackageLocationDetails</title>
    </head>
    <body>
      <%
              
               String editId="";
               String packageid="",locationid="",packagelocationday="";
               if (request.getParameter("eid")!=null)
               {
                String sel="select * from tbl_packagelocation l,tbl_package p,tbl_location d where l.package_id=p.package_id and l.location_id=d.location_id and l.packagelocation_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    packageid=rs.getString("package_id");
                    locationid=rs.getString("location_id");
                    packagelocationday=rs.getString("packagelocation_day");
                    editId=rs.getString("packagelocation_id");
                    
                }
            }
     
            if(request.getParameter("did")!=null)
            {
                
                String str="delete from tbl_packagelocation where packagelocation_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("Packagelocation.jsp");
                }
                out.println(b);
            }
            
            
        String submit=request.getParameter("save");
        if(submit!=null)
        {
        String packagename=request.getParameter("txtpackage");
        String locationname=request.getParameter("txtlocationname");
        String packagelocation=request.getParameter("txtpackagelocation");
        if(request.getParameter("hid")!="")
                {
                    
                    String up="update tbl_packagelocation set package_id='"+packagename+"',location_id='"+locationname+"',packagelocation_day='"+packagelocation+"' where packagelocation_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("Packagelocation.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
        String ins="insert into tbl_packagelocation(package_id,location_id,packagelocation_day)values('"+packagename+"','"+locationname+"','"+packagelocation+"')";
        boolean b=obj.insert(ins);
        out.println(ins);
            if(b)
                    response.sendRedirect("Packagelocation.jsp");
                else
                        {
                            out.print(b);
                        }
                }
       
        
        }
        
        %>
        <form name="frmplace"><center>
                <input type="hidden" name="hid" value="<%=editId%>">
                <table>
                    <td><h1>PackageLocation Details</h1></tr>
                    <tr><td>PackageName</td><td>
                    <select name="txtpackage" id="sel">
                    <option value="select">Select</option>
                                <%
                                    String sel="select * from tbl_package";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                     
                                                                          
                                            
                                     
                                         
                                 %>
                                 <option value="<%=rs.getString("package_id")%>" <%if(packageid.equals(rs.getString("package_id"))){%> selected="" <%}%> ><%=rs.getString("package_name")%></option>
                                 <%}%>
                                            
                    </select></td></tr>
                    <tr><td>LocationName</td><td>
                    <select name="txtlocationname" id="sel1">
                    <option value="select">Select</option>
                                <%
                                    String sel1="select * from tbl_location";
                                    ResultSet rr=obj.select(sel1);
                                    while(rr.next())
                                    {
                                     
                                                                          
                                            
                                     
                                         
                                 %>
                                 <option value="<%=rr.getString("location_id")%>" <%if(locationid.equals(rr.getString("location_id"))){     %> selected="" <%}%> ><%=rr.getString("location_name")%></option>
                                 <%}%>
                                            
                    </select></td></tr>
                    <tr><td>PackageLocation Day</td><td> <input type="text" name="txtpackagelocation" id="packagelocation" value="<%=packagelocationday%>"></td></tr>
                    <tr><td><input type="submit" name="save" value="Save"></td>
                        <td><input type="reset" name="Cancel" value="Cancel">
                </table>
                       <table>
                    
               
                    <tr><td> <h2> <u>PackageLocation Details</u></h2></td></tr>
                    <tr><td>PackageName</td><td>LocationName</td><td>PackageLocation Day</td>
                    <%
                        String sel2="select * from tbl_packagelocation l,tbl_pa ckage p,tbl_location d where l.package_id=p.package_id and l.location_id=d.location_id";
                        ResultSet rs1=obj.select(sel2);
                        while(rs1.next())
                        {
                            %>
                   <tr><td><%=rs1.getString("package_name")%></td>
                        <td><%=rs1.getString("location_name")%></td>
                        <td><%=rs1.getString("packagelocation_day")%></td>
                        <td><a href="Packagelocation.jsp?eid=<%=rs1.getString("packagelocation_id")%>"> Edit</a></td>
                        <td><a href="Packagelocation.jsp?did=<%=rs1.getString("packagelocation_id")%>"> Delete</a></td></tr>
                       <% }%>
                </table>   
            </center></form> 
    </body>
</html>
