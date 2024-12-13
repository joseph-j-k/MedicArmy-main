<%-- 
    Document   : Medicine
    Created on : 28 Aug, 2024, 2:40:53 PM
    Author     : ADWAITHA SAJU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicine</title>
    </head>
    <body>
        <div class="container">
            <div class="card">

        <%
            if (request.getParameter("did") != null) {
                String delQry = "delete from tbl_medicine where medicine_id=" + request.getParameter("did");
                if (con.executeCommand(delQry)) {
        %>
        <script>
            alert("Deleted");
            window.location = "Medicine.jsp";
        </script>
        <%
                }
            }
        %>


        <h1 align="center" class="card-title">Medicine</h1>
        <div class="card-body">
        <form  method="post" action="../Assets/ActionPages/MedicineUpload.jsp" enctype="multipart/form-data">
            <table align="center" class="table table-responsive table-bordered">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" id="txtname" placeholder="Enter Your Name" required="required"><br></td>
                </tr>

                <tr>
                    <td>Description
                    <td><textarea name="txtdescription" id="txtdescription" placeholder="Enter Description" required="required"></textarea><br></td>
                </tr>


                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" id="image" placeholder="Enter Image" required="required"><br></td>
                </tr>


                
                <tr>
                    <td>Category</td>
                    <td>


                        <select name="selcategory" onchange="getSubCategory(this.value)">
                            <option name="">...Select</option>

                            <%
                                String selQry = "select * from tbl_category";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) { 
                            %>

                            <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>

                            <%
                                }
                            %>

                        </select>

                </tr>
                
               <tr>
                    <td>SubCategory</td>

                    <td><select name="sel_subcateory" id="sel_subcategory">
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
       
                
                <tr>
                    <td>Rate</td>
                    <td><input type="text" name="txtrate" id="txtrate" placeholder="Enter Rate" required="required"><br></td>
                </tr>

               

                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"><br></td>
                </tr>
            </table>
       
        </form>   
        
                            
                             <script src="../Assets/JQ/jQuery.js"></script>
                            <script>
                                    function getSubCategory(cid) {
                                    $.ajax({
                                    url: "../Assets/AjaxPages/AjaxSubCategory.jsp?cid=" + cid,
                                    success: function (result) {

                                    $("#sel_subcategory").html(result);
                                  }
                                });
                             }

       
                            </script>
                            
        </div>
            </div>
        </div>
    </body>
</html>

<table border="1" align="center">
    <thead>
        <tr>
            <th>Sl.No</th>
            <th>Name</th>
            <th>Description</th>
            <th>Image</th>
            <th>Subcategory</th>
            <th>Rate</th>
            <th>shop</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <%
            String selQry3 = "select * from tbl_medicine m inner join tbl_subcategory s on m.subcategory_id = s.subcategory_id inner join tbl_shop sh on sh.shop_id = m.shop_id where m.shop_id="+session.getAttribute("sid");
            ResultSet rs3 = con.selectCommand(selQry3);
            int i = 0;
            while (rs3.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs3.getString("medicine_name")%></td>
            <td><%= rs3.getString("medicine_description")%></td>
            <td><%= rs3.getString("medicine_image")%></td>
            <td><%= rs3.getString("subcategory_name")%></td>
            <td><%= rs3.getString("medicine_rate")%></td>
            <td><%= rs3.getString("shop_name")%></td>
            <td><a href="Medicine.jsp?did=<%= rs3.getString("medicine_id")%>">Delete</a> ||
            <a href="Stock.jsp?mid=<%= rs3.getString("medicine_id")%>">Add Stock</a>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

    <center>     
    <a href="HomePage.jsp">HomePage</a>
</center>


<%@include  file="Foot.jsp" %>