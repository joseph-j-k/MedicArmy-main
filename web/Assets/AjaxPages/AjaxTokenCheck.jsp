<%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    // Get the logged-in user's ID
    Integer userId = (Integer) session.getAttribute("uid");

    // Check if the user ID is null
    if (userId == null) {
        out.print("{\"error\": \"User not logged in\"}");
        return;
    }

    // Get today's date in 'yyyy-MM-dd' format
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String todayDate = dateFormat.format(new Date());

    boolean hasAppointment = false;
    String appointmentToken = "";
    String query = "SELECT appointment_token FROM tbl_appointment WHERE user_id = '" + userId + "' AND appointment_fordate = '" + todayDate + "'";
    ResultSet rs = con.selectCommand(query);
    if (rs.next()) {
        hasAppointment = true;
        appointmentToken = rs.getString("appointment_token");
    }

    out.print(appointmentToken);
%>
