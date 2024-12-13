<%-- 
    Document   : Availability
    Created on : 30 Aug, 2024, 8:02:39 PM
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
        <title>Availabily</title>
    </head>
    <body>
        <div class="container">
            <div class="card">

                <%
                    if (request.getParameter("btnsubmit") != null) {
                        String stime = request.getParameter("stime");
                        String etime = request.getParameter("etime");
                        String slot = request.getParameter("slot");
                        String insQry = "insert into tbl_availability(availability_stime,availability_etime,availability_slot,clinic_id) values('" + stime + "','" + etime + "','" + slot + "','" + session.getAttribute("cid") + "')";
                        out.println(insQry);
                        if (con.executeCommand(insQry)) {
                %>
                <script>
                    alert("Record Saved");
                    window.location = "Availability.jsp";
                </script>
                <%
                        }
                    }
                %>

                <%
                    if (request.getParameter("did") != null) {
                        String delQry = "delete from tbl_availability where availability_id=" + request.getParameter("did");
                        if (con.executeCommand(delQry)) {
                %>
                <script>
                    alert("Deleted");
                    window.location = "Availability.jsp";
                </script>
                <%
                        }
                    }
                %>



                <h1 align="center" class="card-title">Availabilty</h1>
                <div class="card-body">
                    <form method="post">

                        <table align="center" class="table table-responsive table-bordered">
                            <tr>
                                <td>Start time</td>
                                <td><input type="time" name="stime" id="stime" placeholder="Enter start time" required="required"><br></td>
                            </tr>

                            <tr>
                                <td>End time</td>
                                <td><input type="time"  name="etime" id="etime" placeholder="Enter end time" required="required"></textarea><br></td>
                            </tr>

                            <tr>
                                <td>Slot</td>
                                <td><input type="number" name="slot" id="slot" placeholder="Enter slot" required="required"><br></td>
                            </tr>


                            <tr>
                                <td colspan="2" align="center"><input type="submit"  id="btnsubmit" name="btnsubmit" value="Submit"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>


<table border="1" align="center">
    <thead>
        <tr>
            <th>Sl.No</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Slot</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <%
            String selQry1 = "select * from tbl_availability where clinic_id=" + session.getAttribute("cid");
            ResultSet rs1 = con.selectCommand(selQry1);
            int i = 0;
            while (rs1.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs1.getString("availability_stime")%></td>
            <td><%= rs1.getString("availability_etime")%></td>
            <td><%= rs1.getString("availability_slot")%></td>


            <td><a href="Availability.jsp?did=<%= rs1.getString("availability_id")%>">Delete</a></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
<%@include  file="Foot.jsp" %>

