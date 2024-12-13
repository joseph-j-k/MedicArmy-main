<%-- 
    Document   : OTP_Validator
    Created on : 12 Nov, 2024, 11:05:51 AM
    Author     : ADWAITHA SAJU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(request.getParameter("btn_submit") != null) {
    String oTp = request.getParameter("txtotp");
    Integer sessionOtp = (Integer) session.getAttribute("otp"); // Get session OTP as Integer
    
    if (oTp != null && sessionOtp != null && oTp.equals(sessionOtp.toString())) {
        %>
        <script>
            alert("OTP Validation Successful");
            window.location="ResetPassword.jsp";
        </script>
        <%
    } else {
%>
        <script>
            alert("OTP Incorrect");
        </script>
<%
    }
}
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP Validator</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">OTP Validator</h1>
        <table align="center">
            <tr>
                <td>OTP</td>
                <td><input type="text" id="txtotp" name="txtotp" placeholder="Enter OTP here"></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="btn_submit" value="Submit">
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
