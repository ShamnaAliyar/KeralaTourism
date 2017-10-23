<%-- 
    Document   : Roomimageupload
    Created on : Oct 9, 2017, 3:36:38 PM
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
       <form action="UploadActionRoom.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="fileupload">
            <input type="submit" name="sub" value="Submit">
            
            
            
        </form>
    </body>
</html>
