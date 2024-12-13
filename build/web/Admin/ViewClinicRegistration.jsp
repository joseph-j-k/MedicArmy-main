<%-- 
    Document   : ViewClinicRegistration
    Created on : 20 Sep, 2024, 12:31:55 PM
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
        <title>Registered clinic</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h1 align="center" class="card-title">Registered clinic</h1>

                <div class="card-body">
                    <%
                        if (request.getParameter("aid") != null) {
                            String upQry = "update tbl_clinic  set clinic_vstatus = 1 where clinic_id=" + request.getParameter("aid");
                            if (con.executeCommand(upQry)) {
                    %>
                    <script>
                        alert("Accepted");
                        window.location = "ViewClinicRegistration.jsp";
                    </script>
                    <%
                            }
                        }
                    %>



                    <%
                        if (request.getParameter("rid") != null) {
                            String upQry = "update tbl_clinic  set  clinic_vstatus = 2  where clinic_id =" + request.getParameter("rid");
                            if (con.executeCommand(upQry)) {
                    %>
                    <script>
                        alert("Rejected");
                        window.location = "ViewClinicRegistration.jsp";
                    </script>
                    <%
                            }
                        }
                    %>


                    <table border="1" align="center" class="table table-responsive table-bordered">
                        <thead>
                            <tr>
                                <th>Sl.No</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Contact</th>
                                <th>logo</th>
                                <th>proof</th>
                                <th>place</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                String selQry1 = "select * from tbl_clinic s inner join tbl_place p on p.place_id = s.place_id where clinic_vstatus=0";
                                ResultSet rs1 = con.selectCommand(selQry1);
                                int i = 0;
                                while (rs1.next()) {
                                    i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%= rs1.getString("clinic_name")%></td>
                                <td><%= rs1.getString("clinic_email")%></td>
                                <td><%= rs1.getString("clinic_address")%></td>
                                <td><%= rs1.getString("clinic_contact")%></td>
                                <td><%= rs1.getString("clinic_logo")%></td>
                                <td><%= rs1.getString("clinic_proof")%></td>
                                <td><%= rs1.getString("place_name")%></td>



                                <td><a href="ViewClinicRegistration.jsp?aid=<%= rs1.getString("clinic_id")%>">Accept</a>
                                    <a href="ViewClinicRegistration.jsp?rid=<%= rs1.getString("clinic_id")%>">Reject</a></td>

                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>






                    <table border="1" align="center">
                        <thead>
                        <h1 align="center">Clinic Accepted List</h1>
                        <tr>
                            <th>Sl.No</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Contact</th>
                            <th>logo</th>
                            <th>proof</th>
                            <th>place</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>

                            <%
                                String selQry2 = "select * from tbl_clinic s inner join tbl_place p on p.place_id = s.place_id where clinic_vstatus=1";
                                ResultSet rs2 = con.selectCommand(selQry2);
                                int j = 0;
                                while (rs2.next()) {
                                    j++;
                            %>
                            <tr>
                                <td><%=j%></td>
                                <td><%= rs2.getString("clinic_name")%></td>
                                <td><%= rs2.getString("clinic_email")%></td>
                                <td><%= rs2.getString("clinic_address")%></td>
                                <td><%= rs2.getString("clinic_contact")%></td>
                                <td><%= rs2.getString("clinic_logo")%></td>
                                <td><%= rs2.getString("clinic_proof")%></td>
                                <td><%= rs2.getString("place_name")%></td>


                                <td><a href="ViewClinicRegistration.jsp?rid=<%= rs2.getString("clinic_id")%>">Reject</a></td>

                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>



                    <table border="1" align="center">
                        <thead>
                        <h1 align="center">Clinic Rejected List</h1>
                        <tr>
                            <th>Sl.No</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Contact</th>
                            <th>logo</th>
                            <th>proof</th>
                            <th>place</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>

                            <%
                                String selQry3 = "select * from tbl_clinic s inner join tbl_place p on p.place_id = s.place_id where clinic_vstatus=2";
                                ResultSet rs3 = con.selectCommand(selQry3);
                                int k = 0;
                                while (rs3.next()) {
                                    k++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%= rs3.getString("clinic_name")%></td>
                                <td><%= rs3.getString("clinic_email")%></td>
                                <td><%= rs3.getString("clinic_address")%></td>
                                <td><%= rs3.getString("clinic_contact")%></td>
                                <td><%= rs3.getString("clinic_logo")%></td>
                                <td><%= rs3.getString("clinic_proof")%></td>
                                <td><%= rs3.getString("place_name")%></td>



                                <td><a href="ViewClinicRegistration.jsp?aid=<%= rs3.getString("clinic_id")%>">Accept</a></td>


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

