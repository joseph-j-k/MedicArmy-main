<%-- 
    Document   : UserChangePassword
    Created on : 18 Sep, 2024, 2:22:36 PM
    Author     : ADWAITHA SAJU
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<%
    String dbPw = "";
    if (request.getParameter("btnsubmit") != null) {
        String oldP = request.getParameter("textoldpassword");
        String newP = request.getParameter("textNewpassword");
        String rePw = request.getParameter("textREpassword");
        String query = "select * from tbl_user where user_id=" + session.getAttribute("uid");
        ResultSet rs = con.selectCommand(query);
        rs.next();
        dbPw = rs.getString("user_password");
        if (oldP.equals(dbPw)) {
            if (newP.equals(rePw)) {
                String updQry = "update tbl_user set user_password='" + newP + "' where user_id=" + session.getAttribute("uid");
                if (con.executeCommand(updQry)) {%>
<script>
    alert("Password Updated")
    window.location = "UserChangePassword.jsp";
</script>
<%
} else {

%>
<script>
    alert("Retype password is wrong")
    window.location = "UserChangePassword.jsp";
</script>

<%    }
} else {
%>

<script>
    alert("Data base password and old password is wrong")
    window.location = "UserChangePassword.jsp";
</script>


<%
    }
} else {%>

<script>
    alert("old password is wrong")
    window.location = "UserChangePassword.jsp";
</script>
<%
        }

    }

%>

<title>
</title>
</head>
<body>
    <div class="container">
        <div class="card">
            <form method="post">
                <h1 align="center" class="card-title">Change Password</h1>
                <div class="card-body">
                    <table align="center" border="1" class="table table-responsive table-bordered">

                        <tr>
                            <td>Old Password</td>
                            <td><input type="password" name="textoldpassword"></td>
                        </tr>

                        <tr>
                            <td>New Password</td>
                            <td><input type="password" name="textNewpassword"></td>
                        </tr>

                        <tr>
                            <td>Re-Type Password</td>
                            <td><input type="password" name="textREpassword"></td>
                        </tr>
                         <tr>

                        <td colspan="2" align="center">
                            <input type="submit" name="btnsubmit" value="Change Password">
                            <input type="reset" name="btncancel" value="Cancel">
                        </td>
                        </tr>
                    </table>
                   


                </div>
            </form>
        </div>

    </div>

</body>

<center>     
    <a href="HomePage.jsp">Back</a>
</center>


<%@include file="Foot.jsp" %>

