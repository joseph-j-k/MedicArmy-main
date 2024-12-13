<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clinic Registration</title>
    <style>
        body {
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
        }
        form{
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .card {
            padding: 20px;
        }
        .card-title {
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
        input[type="text"],
        input[type="email"],
        input[type="file"],
        input[type="password"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
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
        .form-group select {
            height: 40px;
        }
        .script-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h1 class="card-title">Clinic Registration</h1>

            <%
                if (request.getParameter("did") != null) {
                    String delQry = "DELETE FROM tbl_clinic WHERE clinic_id=" + request.getParameter("did");
                    if (con.executeCommand(delQry)) {
            %>
            <div class="alert">Deleted successfully.</div>
            <script>
                window.location = "ClinicRegistration.jsp";
            </script>
            <%
                    }
                }
            %>

            <form method="post" action="../Assets/ActionPages/ClinicUpload.jsp" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="txtname">Name</label>
                    <input type="text" name="txtname" id="txtname" placeholder="Enter Your Name" required>
                </div>

                <div class="form-group">
                    <label for="txtaddress">Address</label>
                    <textarea name="txtaddress" id="txtaddress" placeholder="Enter the Address" required></textarea>
                </div>

                <div class="form-group">
                    <label for="txtemail">Email</label>
                    <input type="email" name="txtemail" id="txtemail" placeholder="Enter Your Email" required>
                </div>

                <div class="form-group">
                    <label for="txtcontact">Contact</label>
                    <input type="text" name="txtcontact" id="txtcontact" placeholder="Enter Contact" required>
                </div>

                <div class="form-group">
                    <label for="txtlogo">Logo</label>
                    <input type="file" name="txtlogo" id="txtlogo" required>
                </div>

                <div class="form-group">
                    <label for="seltype">Proof Type</label>
                    <select name="seltype" required>
                        <option value="">--Select--</option>
                        <option value="Aadhar">Aadhar Card</option>
                        <option value="License">License</option>
                        <option value="ID">Voter ID</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="proof">Proof</label>
                    <input type="file" name="proof" id="proof" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" name="password" id="password" placeholder="Enter Password" required>
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
                    <label for="seltype">Clinic Type</label>
                    <select name="seltype" required>
                        <option value="">...Select</option>
                        <%
                            String selQry1 = "SELECT * FROM tbl_type";
                            ResultSet rs1 = con.selectCommand(selQry1);
                            while (rs1.next()) {
                        %>
                        <option value="<%=rs1.getString("type_id")%>"><%=rs1.getString("type_name")%></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit">
                </div>
            </form>

            <div class="script-container">
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
        </div>
    </div>
</body>
</html>
