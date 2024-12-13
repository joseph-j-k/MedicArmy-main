<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    // Check if session attribute 'uid' is set to avoid NullPointerException
    Object sessionUid = session.getAttribute("uid");
    if (sessionUid == null) {
        out.println("User not logged in. Please log in to view messages.");
        return; // Exit the page if 'uid' is not set
    }

    String selQry = "select * from tbl_chat c inner join tbl_user u on " +
                    "(u.user_id=c.chat_fromuid) or (u.user_id=c.chat_touid) " +
                    "order by chat_datetime";
    System.out.println("Executing query: " + selQry);
    ResultSet rs = con.selectCommand(selQry);

    while (rs.next()) {
        String chatTouid = rs.getString("chat_touid");
        String chatFromuid = rs.getString("chat_fromuid");
        String chatContent = rs.getString("chat_content");
        String userPhoto = rs.getString("user_photo");
        String userName = rs.getString("user_name");

        // Check if chat_touid matches the session uid (user receiving the message)
        if (chatTouid != null && chatTouid.equals(sessionUid.toString())) {
            // Get clinic details for received messages
            String selClinic = "select * from tbl_clinic where clinic_id='" + request.getParameter("cid") + "'";
            System.out.println("Fetching clinic details with query: " + selClinic);
            ResultSet clinicResult = con.selectCommand(selClinic);
            if (clinicResult.next()) {
                String clinicLogo = clinicResult.getString("clinic_logo");
                String clinicName = clinicResult.getString("clinic_name");
%>

<div class="chat-message is-received">
    <img src="../../Assets/Files/ClinicDocs/<%= clinicLogo %>" alt="">
    <div class="message-block">
        <span><%= clinicName %></span>
        <div class="message-text"><%= chatContent %></div>
    </div>
</div>

<%
            }
        // Check if chat_fromuid matches the session uid (user sending the message)
        } else if (chatFromuid != null && chatFromuid.equals(sessionUid.toString())) {
%>
<div class="chat-message is-sent">
    <img src="../../Assets/Files/UserDocs/<%= userPhoto %>" alt="">
    <div class="message-block">
        <span><%= userName %></span>
        <div class="message-text"><%= chatContent %></div>
    </div>
</div>

<%
        }
    }
%>
