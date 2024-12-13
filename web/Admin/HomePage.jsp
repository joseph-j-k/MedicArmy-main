<%@include file="Header.jsp" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

           
                <section class="row">
                    <div class="col-12 col-lg-12">
<!--                        <div class="row">
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon purple">
                                                    <i class="iconly-boldShow"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Profile Views</h6>
                                                <h6 class="font-extrabold mb-0">112.000</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon blue">
                                                    <i class="iconly-boldProfile"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Followers</h6>
                                                <h6 class="font-extrabold mb-0">183.000</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon green">
                                                    <i class="iconly-boldAdd-User"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Following</h6>
                                                <h6 class="font-extrabold mb-0">80.000</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon red">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Saved Post</h6>
                                                <h6 class="font-extrabold mb-0">112</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>New Appointments</h4>
                                    </div>
                                    <div class="card-body">
                                        <table border="1" align="center" class="table table-responsive table-bordered">
                        <thead>
                            <tr>
                                <th>Sl.No</th>
                                <th>User</th>
                                <th>Fordate</th>
                                <th>StartTime</th>
                                <th>EndTime</th>
                                <th>Amount</th>
                                <th>Contact</th>
                                <th>Slot</th>


                            </tr>
                        </thead>
                        <tbody>

                            <%            String selQry1 = "select * from tbl_appointment ap inner join tbl_availability a on ap.availability_id = a.availability_id inner join tbl_user u on u.user_id = ap.user_id where appointment_status=0 order by appointment_date DESC";
                    //    out.println(selQry1);
                                ResultSet rs1 = con.selectCommand(selQry1);
                                int i = 0;
                                while (rs1.next()) {
                                    i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%= rs1.getString("user_name")%></td>
                                <td><%= rs1.getString("appointment_fordate")%></td>
                                <td><%= rs1.getString("availability_stime")%></td>
                                <td><%= rs1.getString("availability_etime")%></td>
                                <td><%= rs1.getString("appointment_amount")%></td>
                                <td><%= rs1.getString("user_contact")%></td>
                                <td><%= rs1.getString("appointment_token")%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                </section>
<%@include file="Footer.jsp" %>
           