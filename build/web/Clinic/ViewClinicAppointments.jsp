<%-- 
    Document   : VeiwClinicAppointments
    Created on : 27 Oct, 2024, 3:49:44 PM
    Author     : ADWAITHA SAJU
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Head.jsp" %>
<%
    if (request.getParameter("id") != null) {
        
        String query = "SELECT u.name, u.email, a.appointment_date, a.clinic_name " +
                       "FROM tbl_appointment a " +
                       "JOIN tbl_user u ON a.user_id = u.user_id " +
                       "WHERE a.appointment_date = CURDATE()";
        ResultSet rs=con.selectCommand(query);
        
      common_classes.MailConnection m = new common_classes.MailConnection();
      
      while (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
            String clinicName = rs.getString("clinic_name");

            // Email content
            String subject = "Appointment Reminder";
            String text = "Dear " + name + ",\r\n\r\n" +
                             "This is a reminder for your appointment scheduled today at " + clinicName + ".\r\n" +
                             "Please ensure you arrive on time. If you have any queries, contact the clinic.\r\n\r\n" +
                             "Best regards,\r\n" +
                             "Clinic Team";

        
        
         
        
        boolean b = m.sendMail(email, subject, text);
        
        if (b) {
            System.out.println("Email sent successfully to: " + email);
        } else {
            System.out.println("Failed to send email to: " + email);
        }
    }

    
    response.sendRedirect("ViewClinicAppointments.jsp");

    }

    


        
    
    if (request.getParameter("reject") != null) {

        String updQry = "update tbl_request SET request_status=2 where ads_id='" + request.getParameter("reject") + "'";
        con.executeCommand(updQry);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h1 align="center" class="card-title">Appointment Details</h1>
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
                                <th>Action</th>


                            </tr>
                        </thead>
                        <tbody>

                            <%            String selQry1 = "select * from tbl_appointment ap inner join tbl_availability a on ap.availability_id = a.availability_id inner join tbl_user u on u.user_id = ap.user_id where clinic_id= '" + session.getAttribute("cid") + "' order by appointment_id DESC";
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
                                <td>
                                    <% if (rs1.getInt("appointment_status") == 1) {
                                        if (rs1.getInt("appointment_type") == 1) {
                                    %><a href="Chat/Chat.jsp?uid=<%= rs1.getString("user_id")%>">Chat</a>|
                                       <%}%>
                                     <a href="Presecription.jsp?aid=<%= rs1.getString("appointment_id")%>">Add Presecription </a>
                                    <%

                                    } else if (rs1.getInt("appointment_status") == 2) {
                                    %>
                                    <a href="../Assets/Files/PrecescriptionDocs/<%= rs1.getString("presecription_image")%>">View Prescription</a>
                                    <%
                                    }
                                    else if (rs1.getInt("appointment_status") == 3) {
                                        if (rs1.getString("shop_id").equals("NULL")) {
                                            %>
                                    <a href="ViewMedicalShop.jsp?aid=<%= rs1.getString("appointment_id")%>">Assign Shops</a>
                                    <%
                                        }
                                        else{
                                            out.print("Order Assigned");
                                        }
                                    }
                                    else if (rs1.getInt("appointment_status") == 4) {
                                    %>
                                    Order Packed.
                                    <%
                                    } else if (rs1.getInt("appointment_status") == 5) {
                                    %>
                                    Order Assigned.
                                    <%
                                    } else if (rs1.getInt("appointment_status") == 6) {
                                    %>
                                    Order Taken.
                                    <a href="../Assets/Files/PrecescriptionDocs/<%= rs1.getString("presecription_image")%>">View Prescription</a>
                                    <%
                                    } else if (rs1.getInt("appointment_status") == 7) {
                                    %>
                                    Order Completed..
                                    <a href="../Assets/Files/PrecescriptionDocs/<%= rs1.getString("presecription_image")%>">View Prescription</a>
                                    <%
                                    } else if (rs1.getInt("appointment_status") == 8) {
                                    %>
                                    Concultation Completed

                                    <%
                                        }
                                    else{
                                        out.println("Consultation Completed");
                                    }
                                    %>




                                </td>





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

</body>
</html>
<%@include  file="Foot.jsp" %>