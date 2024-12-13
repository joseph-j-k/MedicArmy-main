<%--
Document   : viewUserRegistration   
Created on : 20 Sep, 2024, 12:26:16 PM
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
        <title>Registered User</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h1 align="center" class="card-title"> Registered User</h1>
                <div class="card-body">

                    <table border="1" align="center" class="table table-responsive table-bordered">
                        <thead>
                            <tr>
                                <th>Sl.No</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Address</th>
                                <th>Contact</th>
                                <th>Gender</th>
                                <th>Dob</th>
                                <th>Photo</th>
                                <th>Place</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                String selQry1 = "select * from tbl_user u inner join tbl_place p on p.place_id=u.place_id";
                                ResultSet rs1 = con.selectCommand(selQry1);
                                int i = 0;
                                while (rs1.next()) {
                                    i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%= rs1.getString("user_name")%></td>
                                <td><%= rs1.getString("user_email")%></td>
                                <td><%= rs1.getString("user_password")%></td>
                                <td><%= rs1.getString("user_address")%></td>
                                <td><%= rs1.getString("user_contact")%></td>
                                <td><%= rs1.getString("user_gender")%></td>
                                <td><%= rs1.getString("user_dob")%></td>
                                <td><%= rs1.getString("user_photo")%></td>
                                <td><%= rs1.getString("place_name")%></td>



                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>  
</html>

<center>     
    <a href="HomePage.jsp">Back</a>
</center>

<%@include  file="Foot.jsp" %>