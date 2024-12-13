<%-- 
    Document   : ClinicUpload
    Created on : 19 Sep, 2024, 2:17:49 PM
    Author     : ADWAITHA SAJU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%

    FileItem f_item = null;
    File savedFile = null;

    String field_name = "";
    String logo = "", proof = "";
    String file_name = "";

    String field[] = new String[20];
    String value[] = new String[20];

//checking if request cotains multipart data
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);//true/false

    if (isMultipart) {

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        //declaring a list of form fields.everything on form adding t itemlist
        List items_list = null;

        //assigning fields to list 'items_list'
        try {
            items_list = upload.parseRequest(request);//requeat contains evrything on form this is parsed and stored to item_list
        } catch (FileUploadException ex) {
            out.println(ex);
        }

        //declaring iterator used to iterate through all positions in item_lists
        Iterator itr = items_list.iterator();
        int k = 0;
        //iterating through the list 'items_list'
        while (itr.hasNext())//checking if there is any value in the position like rs.next()
        {

            //typecasting next element in items_list as fileitem
            f_item = (FileItem) itr.next();// value to which the iterator points  and is coverted to fileitem format

            //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc) or multipath
            if (f_item.isFormField()) {

                //getting fieldname and value
                field[k] = f_item.getFieldName();//field
                value[k] = f_item.getString();//student typing value

                k++;//
            } else//when it is an image or multipart
            {

                //f_item=(FileItem)itr.next();
                file_name = f_item.getName();
                field_name = f_item.getFieldName();

                if (field_name.equals("proof"))//write the name of image here it is img_product
                {
                    String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                    //setting path to store image
                    File proj_path = new File(config.getServletContext().getRealPath("/"));
                    String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Files\\ClinicDocs";//path for storing image
                    Random r = new Random();//to generate random number
                    int r_num = r.nextInt(1111) + 999;//values between this are generated

                    proof = "clinicProof" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                    //creating a file object
                    savedFile = new File(file_path + proof);//fn contains name of file
                    try {
                        //writing the file object
                        f_item.write(savedFile);  //writing to server means the folder             

                    } catch (Exception ex) {
                        out.println(ex);
                    }
                }
                
                if (field_name.equals("txtlogo"))//write the name of image here it is img_product
                {
                    String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                    //setting path to store image
                    File proj_path = new File(config.getServletContext().getRealPath("/"));
                    String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Files\\ClinicDocs\\";//path for storing image
                    Random r = new Random();//to generate random number
                    int r_num = r.nextInt(1111) + 999;//values between this are generated

                    logo = "clinicLogo" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                    //creating a file object
                    savedFile = new File(file_path + logo);//fn contains name of file
                    try {
                        //writing the file object
                        f_item.write(savedFile);  //writing to server means the folder             

                    } catch (Exception ex) {
                        out.println(ex);
                    }
                }


                //to upload proof of doctor
            }

        }
    }

    String InsQry = "INSERT INTO tbl_clinic(clinic_name,clinic_address,clinic_email,clinic_contact,clinic_logo,clinic_prooftype,clinic_proof,clinic_password,place_id,type_id)"
            + "values('" + value[0] + "','" + value[1] + "','" + value[2] + "','" + value[3] + "','" + logo + "','"+ value[4] +"','" + proof + "','" + value[5] + "','" + value[7] + "','" + value[8] + "')";

    System.out.println(InsQry);
    out.println(InsQry);
    boolean status = obj.executeCommand(InsQry);
    
    

    if (status == true) {
        
        String SelQry=" select max(clinic_id) as max from tbl_clinic";
       ResultSet rs = con.selectCommand(SelQry);
       rs.next();
       int number = 1000 + rs.getInt("max");
       String registerNumber = "MC"+number;
       String Updqry="UPDATE tbl_clinic set clinic_regno='"+registerNumber+"' where clinic_id="+rs.getInt("max");
       con.executeCommand(Updqry);
       
       
        
%> 
<script type="text/javascript">
    alert("Registration Completed");
    setTimeout(function() {
        window.location.href = '../../Guest/ClinicRegistration.jsp'
    }, 40);//40millisecend it go to next page
</script>
<%
    }


%>