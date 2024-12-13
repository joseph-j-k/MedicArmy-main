<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@ page import="java.time.LocalDate" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New User Registration</title>
    <style>
        body {
            background-color: #e9f7fc;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            color: #555;
        }
        form{
            padding: 20px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="file"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="radio"] {
            margin-right: 10px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .alert {
            color: #ff0000;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="form-title">User Registration</h1>

        <%
            if (request.getParameter("did") != null) {
                String delQry = "DELETE FROM tbl_user WHERE user_id=" + request.getParameter("did");
                if (con.executeCommand(delQry)) {
        %>
        <div class="alert">Deleted successfully.</div>
        <script>
            window.location = "NewUserRegistration.jsp";
        </script>
        <%
                }
            }
        %>

        <form method="post" action="../Assets/ActionPages/UserUpload.jsp" enctype="multipart/form-data">
            <div class="form-group">
                <label for="txtname">Name</label>
                <input type="text" name="txtname" id="txtname" placeholder="Enter Your Name" required>
            </div>

            <div class="form-group">
                <label for="txtemail">Email</label>
                <input type="email" name="txtemail" id="txtemail" placeholder="Enter Your Email" required>
            </div>

            <div class="form-group">
                <label for="txtpassword">Password</label>
                <input type="password" name="txtpassword" id="txtpassword" placeholder="Enter Your Password" required>
            </div>

            <div class="form-group">
                <label for="txtaddress">Address</label>
                <textarea name="txtaddress" id="txtaddress" placeholder="Enter Your Address" required></textarea>
            </div>

            <div class="form-group">
                <label for="txtcontact">Contact</label>
                <input type="text" name="txtcontact" id="txtcontact" placeholder="Enter Your Phone Number" required>
            </div>

            <div class="form-group">
                <label>Gender</label>
                <input type="radio" name="gender" value="male" required> Male
                <input type="radio" name="gender" value="female"> Female
            </div>

            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" name="dob" id="dob" required max="<%= LocalDate.now().minusYears(18) %>">
            </div>

            <div class="form-group">
                <label for="photo">Photo</label>
                <input type="file" name="photo" id="photo" required>
            </div>

            <div class="form-group">
                <label for="seldistrict">District</label>
                <select name="seldistrict" id="seldistrict" onchange="getPlace(this.value)" required>
                    <option value="">...Select</option>
                    <%
                        String selQry = "SELECT * FROM tbl_district";
                        ResultSet rs = con.selectCommand(selQry);
                        while (rs.next()) {
                    %>
                    <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="sel_place">Place</label>
                <select name="sel_place" id="sel_place" required>
                    <option value="">---Select---</option>
                </select>
            </div>

            <div class="form-group">
                <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit">
            </div>
        </form>

        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getPlace(cid) {
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxPlace.jsp?cid=" + cid,
                    success: function(result) {
                        $("#sel_place").html(result);
                    }
                });
            }
        </script>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <a href="HomePage.jsp">Go to HomePage</a>
    </div>
</body>
</html>
