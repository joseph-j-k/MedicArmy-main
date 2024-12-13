<%-- 
    Document   : Login
    Created on : 19 Aug, 2024, 12:46:59 PM
    Author     : ADWAITHA SAJU
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1 align="center">Login</h1>


        <%
            if (request.getParameter("btnlogin") != null) {

                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");

                String selQryAdmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
                String selQryClinic = "select * from tbl_clinic where clinic_email='" + email + "' and clinic_password='" + password + "'";
                String selQryUser = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
                String selQryShop = "select * from tbl_shop where shop_email='" + email + "' and shop_password='" + password + "'";
                String selQryDelivery = "select * from tbl_deliveryboy where deliveryboy_email='" + email + "' and deliveryboy_password='" + password + "'";

                ResultSet admin = con.selectCommand(selQryAdmin);
                ResultSet clinic = con.selectCommand(selQryClinic);
                ResultSet user = con.selectCommand(selQryUser);
                ResultSet shop = con.selectCommand(selQryShop);
                ResultSet delivery = con.selectCommand(selQryDelivery);

                if (admin.next()) {
                    session.setAttribute("aid", admin.getString("admin_id"));
                    session.setAttribute("aname", admin.getString("admin_name"));
                    response.sendRedirect("../Admin/HomePage.jsp");
                } else if (clinic.next()) {
                    session.setAttribute("cid", clinic.getString("clinic_id"));
                    session.setAttribute("cname", clinic.getString("clinic_name"));
                    response.sendRedirect("../Clinic/HomePage.jsp");
                } else if (shop.next()) {
                    session.setAttribute("sid", shop.getString("shop_id"));
                    session.setAttribute("sname", shop.getString("shop_name"));
                    response.sendRedirect("../MedicalShop/HomePage.jsp");
                } else if (delivery.next()) {
                    session.setAttribute("did", delivery.getString("deliveryboy_id"));
                    session.setAttribute("dname", delivery.getString("deliveryboy_name"));
                    response.sendRedirect("../DeliveryBoy/HomePage.jsp");
                } else if (user.next()) {
                    session.setAttribute("uid", user.getString("user_id"));
                    session.setAttribute("uname", user.getString("user_name"));
                    response.sendRedirect("../User/HomePage.jsp");
                 
                } else {
                    out.print("<script>alert('Iinvalid Credential')</script>");

                }

            }

        %>

        <form method="post">
            <table align="center">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id="txtemail" placeholder="Enter Your Email" required="required"><br></td>
                </tr>

                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" id="txtpassword" placeholder="Enter Your Password" required="required"><br></td>
                </tr>


                <tr>
                    <td colspan="2" align="center"><input type="submit"  id="btnlogin" name="btnlogin" value="submit"><br></td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><a href="NewUserRegistration.jsp">New Registration</a><br></td>
                </tr>


            </table>
        </form>
    </body>
</html>

