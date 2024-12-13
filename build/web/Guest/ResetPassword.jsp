<%-- 
    Document   : ResetPassword
    Created on : 12 Nov, 2024, 11:06:19 AM
    Author     : ADWAITHA SAJU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">Reset Password</h1>
        <table align="center">
            <tr>
                <td>New Password</td>
                <td><input type="text" id="txtpass" name="txtpass" placeholder="Enter your new password"></td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td><input type="text" id="txtconpass" name="txtconpass" placeholder="Enter your confirm password"></td>
            </tr>
             <tr>
                <td>
                    <button type="submit" name="btnsubmit" id="btnsubmit">Login</button></td>
            </tr>
        </table>
        </form>
    </body>
</html>


 <%
        if(request.getParameter("btnsubmit")!=null){
        
            String newP=request.getParameter("txtpass");
            String rePw=request.getParameter("txtconpass");
            if (newP.equals(rePw)) {
                if(session.getAttribute("ruid")!=null) 
        {
                String updQry = "update tbl_user set user_password='" + newP + "' where user_id=" + session.getAttribute("ruid");
                if (con.executeCommand(updQry)) {
                     session.removeAttribute("otp"); 
                     session.removeAttribute("ruid"); 
                     response.sendRedirect("Login.jsp");
               }
        }
            
            else if(session.getAttribute("rcid")!=null){
                String updQry1 = "update tbl_clinic set clinic_password='" + newP + "' where clinic_id=" + session.getAttribute("rcid");
                if (con.executeCommand(updQry1)) {
                    session.removeAttribute("otp"); 
                     session.removeAttribute("rcid"); 
                     response.sendRedirect("Login.jsp");
               }
            }
                else if(session.getAttribute("rsid")!=null){
                String updQry1 = "update tbl_shop set shop_password='" + newP + "' where shop_id=" + session.getAttribute("rsid");
                if (con.executeCommand(updQry1)) {
                    session.removeAttribute("otp"); 
                     session.removeAttribute("rsid"); 
                     response.sendRedirect("Login.jsp");
               }
            }
                else if(session.getAttribute("rdid")!=null){
                String updQry1 = "update tbl_deliveryboy set deliveryboy_password='" + newP + "' where deliveryboy_id=" + session.getAttribute("rdid");
                if (con.executeCommand(updQry1)) {
                    session.removeAttribute("otp"); 
                     session.removeAttribute("rdid"); 
                     response.sendRedirect("Login.jsp");
               }
            }
        }
            else{
                %>
                <script>
                    alert("Incorrect Password");
                </script>
                <%
            }
        }
 %>
        