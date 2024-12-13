<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    // Ensure the session contains a valid clinic ID (cid)
    String sessionCid = (String) session.getAttribute("cid");
    if (sessionCid == null) {
        out.println("Session expired or clinic ID not found.");
        return;
    }

    // Query to fetch chat messages
    String selQry = "SELECT * FROM tbl_chat c INNER JOIN tbl_clinic cl " +
                    " ON (cl.clinic_id = c.chat_fromdid) OR (cl.clinic_id = c.chat_todid) where cl.clinic_id=" + session.getAttribute("cid") +
                    " ORDER BY chat_datetime";
    System.out.println("Executing query: " + selQry);
    ResultSet rs = con.selectCommand(selQry);

    // Iterate over chat records and display messages based on clinic ID
    while (rs.next()) {
        String chatToDid = rs.getString("chat_todid");
        String chatFromDid = rs.getString("chat_fromdid");
        String chatContent = rs.getString("chat_content");

        // Check if the message is received by the current clinic
        if (chatToDid != null && chatToDid.equals(sessionCid)) {
            String userId = request.getParameter("uid");
            String userQuery = "SELECT * FROM tbl_user WHERE user_id='" + userId + "'";
            System.out.println("Executing user query: " + userQuery);
            ResultSet userRs = con.selectCommand(userQuery);

            if (userRs.next()) {
                String userPhoto = userRs.getString("user_photo");
                String userName = userRs.getString("user_name");
%>

<div class="chat-message is-received">
    <img src="../../Assets/Files/UserDocs/<%= userPhoto %>" alt="">
    <div class="message-block">
        <span><%= userName %></span>
        <div class="message-text"><%= chatContent %></div>
    </div>
</div>

<%
            }
        // Check if the message is sent by the current clinic
        } else if (chatFromDid != null && chatFromDid.equals(sessionCid)) {
            String clinicLogo = rs.getString("clinic_logo");
            String clinicName = rs.getString("clinic_name");
%>

<div class="chat-message is-sent">
    <img src="../../Assets/Files/ClinicDocs/<%= clinicLogo %>" alt="">
    <div class="message-block">
        <span><%= clinicName %></span>
        <div class="message-text"><%= chatContent %></div>
    </div>
</div>

<%
        }
    }
%>
