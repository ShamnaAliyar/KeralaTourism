<%-- 
    Document   : UploadactionTouristInsert
    Created on : Dec 10, 2016, 11:06:11 AM
    Author     : MYcomputerr
--%>


<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean class="db.db_connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String field_name = "";
            FileItem f_item = null;
            String file_name = "";

            File savedFile = null;
            String fn = "";

            String field[] = new String[20];
            String value[] = new String[20];

//checking if request cotains multipart data
//boolean isMultipart=ServletFileUpload.isMultipartContent(request);
            boolean isMultipart = true;
            if (isMultipart) {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator
                Iterator itr = items_list.iterator();
                int k = 0, i = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext()) {
                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if (f_item.isFormField()) {

                        //getting fieldname and value
                        field[k] = f_item.getFieldName();
                        value[k] = f_item.getString();
                        System.out.println(k + " " + value[k] + " " + field[k]);
                        k++;
                    } else {
            //f_item=(FileItem)itr.next();

                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();
                        if (!file_name.equals("")) {
                            // if(field_name.equals("photo"))
                            {
                                String ext = file_name.substring(file_name.lastIndexOf("."));
                                //setting path to store image
                                File proj_path = new File(config.getServletContext().getRealPath("/"));
                                
                                
                                
                                String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\Admin\\RoomImages\\";
                                Random r = new Random();
                                int r_num = r.nextInt(1111) + 999;
                                
                                fn = "RoomImages_" + r_num + ext;
                               
                                //creating a file object
                                savedFile = new File(file_path + fn);
                                try {
                                    //writing the file object
                                    f_item.write(savedFile);

                                } catch (Exception ex) {
                                    out.println(ex);
                                }
                                 i++;
                            }

                        }

                    }

                }
    //Strinh str1="insert into tbl_user ()";
                //String image=request.getParameter("image");
             
String id="";
String sel="select ifnull(max(rmtype_id),1) as rmtype_id from tbl_roomtype";
ResultSet rs=obj.select(sel);
if(rs.next())
{
    id=rs.getString("rmtype_id");
}
String up="update tbl_roomtype set room_images='"+fn+"' where rmtype_id='"+id+"'";
boolean b=obj.insert(up);
if(b){
        %> 
        <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function() {
                window.location.href = 'Roomtype.jsp'
            }, 100);
        </script>
        <%
                }
            }


        %>
    </body>
</html>
`   