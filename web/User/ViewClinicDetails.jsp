<%-- 
    Document   : VieDoctorsList
    Created on : 20 Sep, 2024, 12:45:39 PM
    Author     : deepa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Head.jsp" %>
<!DOCTYPE html>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Clinic Details</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h1 align="center" calss="card-title"> Clinics Details</h1>
                <div class="card-body">
                    <form>

                        <table align="center" class="table table-responsive table-bordered">
                            <tr>

                                <%
                                    String selQry2 = "select * from tbl_clinic c where c.clinic_id=" + request.getParameter("hid");
                                    System.out.println(selQry2);
                                    ResultSet rs2 = con.selectCommand(selQry2);
                                    rs2.next();
                                %>
                            </tr>

                            <tr>

                                <%

                                %>
                            </tr>

                        </table>


                            <table border="0" align="center">

                                <tr>
                                    <td><img src="../Assets/Files/ClinicDocs/<%=rs2.getString("clinic_logo")%>" width="100"></td
                                </tr>

                                <tr>
                                    <td> <%= rs2.getString("clinic_name")%></td>

                                </tr>

                                <tr>
                                    <td> <%= rs2.getString("clinic_address")%></td>

                                </tr>

                                <tr>
                                    <td> <%= rs2.getString("clinic_contact")%></td>
                                </tr>
                                <tr>
                                    <td> <%= rs2.getString("clinic_email")%></td>
                                </tr>
                            </table>


                            <table border="0" align="center">
                                <h1 align="center">Availability Details</h1>.

                                <%
                                    String selQry3 = "select * from tbl_availability a where a.clinic_id=" + request.getParameter("hid");
                                    System.out.println(selQry3);
                                    ResultSet rs3 = con.selectCommand(selQry3);
                                    int i = 0;
                                    while (rs3.next()) {
                                        i++;
                                %>

                                <tr>
                                    <td>Start Time</td>
                                    <td> <%= rs3.getString("availability_stime")%></td>

                                </tr>

                                <tr>
                                    <td>End Time</td>
                                    <td> <%= rs3.getString("availability_etime")%></td>

                                </tr>

                                <tr>
                                    <td>Slots</td>
                                    <td> <%= rs3.getString("availability_slot")%></td>
                                </tr>

                                <%
                                    }
                                %>
                            </table>



                        
                    </form>
                </div>
            </div>
        </div>
                            </body>
                            </html>

                            <%@include file="Foot.jsp" %>

