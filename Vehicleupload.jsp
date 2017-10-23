<%-- 
    Document   : Vehicleupload.jsp
    Created on : Oct 9, 2017, 2:42:47 PM
    Author     : student3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UploadActionVehicle.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="fileupload">
            <input type="submit" name="sub" value="Submit">
            
            
            
        </form>
    </body>
</html>
