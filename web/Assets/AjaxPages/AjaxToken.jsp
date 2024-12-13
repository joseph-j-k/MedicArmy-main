<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
String avl = "SELECT * FROM tbl_availability WHERE availability_id=" + request.getParameter("avl");
ResultSet av = con.selectCommand(avl);
av.next();
int count = av.getInt("availability_slot");

String app = "SELECT count(*) AS token FROM tbl_appointment WHERE availability_id=" + request.getParameter("avl") + " AND appointment_fordate='" + request.getParameter("date") + "'";
ResultSet aapmnt = con.selectCommand(app);

// Check if the result set has data
if (aapmnt.next()) {
    int apcount = 0;
    if (aapmnt.getString("token") != null) {
        apcount = aapmnt.getInt("token");
    }
    int utoken = count - apcount;
    out.print(utoken);
} else {
    // Handle the case where no appointments are found
    out.print(count); // Assuming all slots are available if no appointments are found
}
%>
