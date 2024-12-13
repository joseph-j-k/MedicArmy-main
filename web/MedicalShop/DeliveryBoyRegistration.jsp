<%-- 
    Document   : DeliveryBoyRegistration
    Created on : 30 Aug, 2024, 7:03:25 PM
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
        <title>Delivery Boy Registration</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <%
                    if (request.getParameter("btnsubmit") != null) {
                        String InsQry = "insert into tbl_deliveryboy(deliveryboy_name,deliveryboy_address,deliveryboy_email,deliveryboy_password,deliveryboy_contact,shop_id) values('" + request.getParameter("txtname") + "','" + request.getParameter("txtaddress") + "','" + request.getParameter("txtemail") + "','" + request.getParameter("txtpassword") + "','" + request.getParameter("txtcontact") + "','" + session.getAttribute("sid") + "')";
                        System.out.println(InsQry);
                        if (con.executeCommand(InsQry)) {
                %>
                <script>
                    alert("Registered");
                    window.location = "DeliveryBoyRegistration.jsp";
                </script>
                <%
                        }
                    }
                %>

                <%
                    if (request.getParameter("did") != null) {
                        String delQry = "delete from tbl_deliveryboy where deliveryboy_id=" + request.getParameter("did");
                        if (con.executeCommand(delQry)) {
                %>
                <script>
                    alert("Deleted");
                    window.location = "DeliveryBoyRegistration.jsp";
                </script>
                <%
                        }
                    }
                %>



                <h1 align="center" class="card-title">Delivery Boy Registration</h1>
                <form  method="post"  >
                    <div class="card-body">
                        <table align="center" class="table table-responsive table-bordered">
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="txtname" id="txtname" placeholder="Enter Your Name" required="required"><br></td>
                            </tr>

                            <tr>
                                <td>Address</td>
                                <td><textarea  name="txtaddress" id="txtaddress" placeholder="Enter Your Address" required="required"></textarea><br></td>
                            </tr>

                            <tr>
                                <td>Email</td>
                                <td><input type="email" name="txtemail" id="txtemail" placeholder="Enter Your Email" required="required"><br></td>
                            </tr>

                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="txtpassword" id="txtpassword" placeholder="Enter Your Password" required="required"><br></td>
                            </tr>

                            <tr>
                                <td>Contact</td>
                                <td><input type="txt" name="txtcontact" id="txtcontact" placeholder="Enter Your Phone Number" required="required"><br></td>
                            </tr>


                            <tr>
                                <td colspan="2" align="center"><input type="submit"  name="btnsubmit"  id="btnsubmit" value="submit"></td>
                            </tr>


                        </table>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
<%@include  file="Foot.jsp" %>