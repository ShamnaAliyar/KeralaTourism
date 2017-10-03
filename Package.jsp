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
        <title>Package Details</title>
    </head>
    <body>
      <%
              
               String editId="";
               String packagename="",packagetypeid="",packagenumber="",packagerate="";
               if (request.getParameter("eid")!=null)
               {
                String sel="select* from tbl_package where package_id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    packagetypeid=rs.getString("packagetype_id");
                    packagename=rs.getString("package_name");
                    packagenumber=rs.getString("package_no_days");
                    packagerate=rs.getString("package_rate");
                    editId=rs.getString("package_id");
                    
                }
            }
     
            if(request.getParameter("did")!=null)
            {
                
                String str="delete from tbl_package where package_id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(str);
                if(b)
                {
                    response.sendRedirect("Package.jsp");
                }
                out.println(b);
            }
            
            
        String submit=request.getParameter("save");
        if(submit!=null)
        {
        String packagname=request.getParameter("txtpackage");
        String packagetypename=request.getParameter("packagetypename");
        String number=request.getParameter("txtpackagenumber");
        String rate=request.getParameter("txtpackagerate");
        if(request.getParameter("hid")!="")
                {
                    
                    String up="update tbl_package set packagetype_id='"+packagetypename+"',package_name='"+packagname+"',package_no_days='"+number+"',package_rate='"+rate+"' where package_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                        if(b)
                    response.sendRedirect("Package.jsp");
                else
                        {
                            out.print(up);
                        }
                }
                else
                {
        String ins="insert into tbl_package(packagetype_id,package_name,package_no_days,package_rate)values('"+packagetypename+"','"+packagname+"','"+number+"','"+rate+"')";
        boolean b=obj.insert(ins);
        out.println(ins);
            if(b)
                    response.sendRedirect("Package.jsp");
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
                    <td><h1>Package Details</h1></tr>
                    <tr><td>packagetype name</td><td>
                    <select name="packagetypename" id="sel">
                    <option value="select">Select</option>
                                <%
                                    String sel="select * from tbl_packagetype";
                                    ResultSet rs=obj.select(sel);
                                    while(rs.next())
                                    {
                                     
                                                                          
                                            
                                     
                                         
                                 %>
                                 <option value="<%=rs.getString("packagetype_id")%>" <%if(packagetypeid.equals(rs.getString("packagetype_id"))){     %> selected="" <%}%> ><%=rs.getString("packagetype_name")%></option>
                                 <%}%>
                                            
                    </select></td></tr>
                    <tr><td>Package name</td><td> <input type="text" name="txtpackage" id="package" value="<%=packagename%>"></td></tr>
                    <tr><td>Number of days</td><td> <input type="text" name="txtpackagenumber" id="packagenumber" value="<%=packagenumber%>"></td></tr>
                    <tr><td>Package Rate</td><td> <input type="text" name="txtpackagerate" id="packagerate" value="<%=packagerate%>"></td></tr>
                    <tr><td><input type="submit" name="save" value="Save"></td>
                        <td><input type="reset" name="Cancel" value="Cancel">
                </table>
                                 <table>
                    
               
                    <tr><td> <h2> <u>Place List</u></h2></td></tr>
                    <%
                        String sel1="select * from tbl_package l,tbl_packagetype d where l.packagetype_id=d.packagetype_id";
                        ResultSet rs1=obj.select(sel1);
                        while(rs1.next())
                        {
                            %>
                    <tr><td><%=rs1.getString("packagetype_name")%></td>
                        <td><%=rs1.getString("package_name")%></td>
                        <td><%=rs1.getString("package_no_days")%></td>
                        <td><%=rs1.getString("package_rate")%></td>
                        <td><a href="Package.jsp?eid=<%=rs1.getString("package_id")%>"> Edit</a></td>
                        <td><a href="Package.jsp?did=<%=rs1.getString("package_id")%>"> Delete</a></td></tr>
                            
                       <% }%>
                </table>   
            </center></form> 
    </body>
</html>
