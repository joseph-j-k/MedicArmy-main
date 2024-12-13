<%-- 
    Document   : ForgetPassword
    Created on : 12 Nov, 2024, 10:56:26 AM
    Author     : ADWAITHA SAJU
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Foreget Password</title>
        </head>
        <body>
            <form method="post">
                <h1 align="center">Forget Password</h1>
                <table align="center">
                    <tr>
                        <td>E-Mail</td>
                        <td><input type="email" id="txtemail" name="txtemail" placeholder="Enter your email here"></td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" name="btnsubmit" id="btnsubmit">Submit</button></td>
                    </tr>
                </table>
            </form>
        </body>
    </html>

<%
    common_classes.MailConnection m = new common_classes.MailConnection();
    if (request.getParameter("btnsubmit") != null) {

        String email = request.getParameter("txtemail");

        String selUser = "select * from tbl_user where user_email='" + email + "'";
        String selClinic = "select * from tbl_clinic where clinic_email='" + email + "'";
        String selShop = "select * from tbl_shop where shop_email='" + email + "'";
        String selDel = "select * from tbl_deliveryboy  where deliveryboy_email='" + email + "'";
        
        ResultSet user = con.selectCommand(selUser);
        ResultSet clinic = con.selectCommand(selClinic);
        ResultSet shop = con.selectCommand(selShop);
        ResultSet deliveryboy = con.selectCommand(selDel);
        String subject = "Password Reset";
        String name = "";
        if (user.next()) {
            name = user.getString("user_name");
            session.setAttribute("ruid", user.getString("user_id"));
        } else if (clinic.next()) {
            name = clinic.getString("clinic_name");
            session.setAttribute("rcid", clinic.getString("clinic_id"));
        }
        else if (shop.next()) {
            name = shop.getString("shop_name");
            session.setAttribute("rsid", clinic.getString("shop_id"));
        }
        else if (deliveryboy.next()) {
            name = deliveryboy.getString("deliveryboy_name");
            session.setAttribute("rdid", clinic.getString("deliveryboy_id"));
        }
        // Generate a 6-digit OTP
        Random rand = new Random();
        int otp = rand.nextInt(900000) + 100000;  // Generate a 6-digit OTP

        // Store the OTP in session or database for later verification (optional)
        session.setAttribute("otp", otp);

        // Email content with OTP
        String text = "Dear " + name + ", \r\n \r\n"
                + "We have received a request to reset your password. \r\n"
                + "To proceed with the password reset, please use the following One-Time Password (OTP): \r\n"
                + "Your OTP for password reset is: " + otp + " \r\n"
                + "Please enter this OTP in the system to reset your password. \r\n"
                + "If you did not request this, please ignore this email. \r\n \r\n"
                + "Best regards, \r\n"
                + "Team ";

        // Send the email with OTP
        boolean b = m.sendMail(email, subject, text);
        if (b) {
            response.sendRedirect("OTP_Validator.jsp");
        }
    }


%>

