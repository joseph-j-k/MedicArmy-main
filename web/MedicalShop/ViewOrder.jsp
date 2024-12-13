<%-- 
    Document   : ViewPresecription
    Created on : 28 Oct, 2024, 10:57:57 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1"> 
            <tr> 
                <td>#</td>
                <td>User Name </td>
                <td>Email </td>
                <td>Contact </td>
                <td>Address </td>
                <td>Presecription</td>
                <td>Action </td>


            </tr>

            <%
                String pre = " select * from tbl_appointment a inner join tbl_user s on a.user_id=s.user_id   where shop_id=" + session.getAttribute("sid");
                ResultSet res = con.selectCommand(pre);
                int i = 0;
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td><%= i%></td>
                <td><%= res.getString("user_name")%></td>
                <td><%= res.getString("user_email")%></td>
                <td><%= res.getString("user_contact")%></td>
                <td><%= res.getString("user_address")%></td>
                <td><a href="../Assets/Files/PrecescriptionDocs/<%= res.getString("presecription_image")%>"><img src="../Assets/Files/PrecescriptionDocs/<%= res.getString("presecription_image")%>" width="100px" height="100px"></img></a></td>

                <td>
                    <% if (res.getInt("appointment_status") == 3) {
//                            out.print(res.getString("presecription_details"));
                            
                            %>
                            <a href="Search.jsp?aid=<%= res.getString("appointment_id")  %>">Choose Medicine</a>
                            <%
                   
                            } else if (res.getInt("appointment_status") == 4) {

                               
                                 %>
                    
                    <a href="ViewDeliveryBoy.jsp?aid=<%= res.getString("appointment_id")%>">View DeliveryBoy </a>
                    <%
                            } else if (res.getInt("appointment_status") == 5) {

                                out.print("Assign");
                            } else if (res.getInt("appointment_status") == 6) {

                                out.print("Order Taken.");
                            }
                    else if (res.getInt("appointment_status") == 7) {

                                out.print("Order Completed..");
                            }
                    else if (res.getInt("appointment_status") == 8) {

                                out.print("Consultation Completed.");
                            }else if (res.getInt("appointment_status") == 9) {

                                out.print("Appointment cancelled..");
                            }

                        
                    %>

                </td>


            </tr>
            <%
                }


            %>
        </table>
    </body>
</html>

<%@include  file="Foot.jsp" %>