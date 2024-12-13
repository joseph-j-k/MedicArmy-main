<%-- 
    Document   : AdminRegistration
    Created on : 19 Aug, 2024, 11:17:05 AM
    Author     : ADWAITHA SAJU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminRegistration</title>
    </head>
    <body>
        
        <%
            if (request.getParameter("btnsubmit") != null) {
                String name = request.getParameter("txtname");
                String contact = request.getParameter("txtcontact");
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");

                String insQry = "insert into tbl_admin(admin_name,admin_contact,admin_email,admin_password) values('" + name + "','" + contact + "','" + email + "','" + password + "')";
                out.println(insQry);
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "AdminRegistration.jsp";
        </script>
        <%
                }
            }
        %>

        <%
            if (request.getParameter("did") != null) {
                String delQry = "delete from tbl_admin where admin_id=" + request.getParameter("did");
                if (con.executeCommand(delQry)) {
        %>
        <script>
            alert("Deleted");
            window.location = "AdminRegistration.jsp";
        </script>
        <%
                }
            }
        %>
         
        
        <h1 align="center">Registration Form</h1>
        <form>
            <table align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" id="txtname" placeholder="Enter Your Name" required="required"><br></td>
                </tr>
                
               <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" id="txtcontact" placeholder="Enter Contact" required="required"><br></td>
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
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" id="btnsubmit" value="submit"><br></td>
                </tr>
                
            </table>
                
        </form>
            
    </body>
</html>

<table border="1" align="center">
    <thead>
        <tr>
            <th>Sl.No</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <%
            String selQry = "select * from tbl_admin";
            ResultSet rs = con.selectCommand(selQry);
            int i = 0;
            while (rs.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs.getString("admin_name")%></td>
            <td><%= rs.getString("admin_contact")%></td>
            <td><%= rs.getString("admin_email")%></td>
            <td><%= rs.getString("admin_password")%></td>
            <td><a href="AdminRegistration.jsp?did=<%= rs.getString("admin_id")%>">Delete</a></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
    
    <center>     
         <a href="HomePage.jsp">HomePage</a>
   </center>
    
  