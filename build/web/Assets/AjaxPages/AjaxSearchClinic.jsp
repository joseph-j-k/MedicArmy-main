<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
    String pid = request.getParameter("pid");
    String did = request.getParameter("did");
    String cid = request.getParameter("cid");

    // Query to fetch clinic details
    String qry = "SELECT c.*, p.place_name, t.type_name " +
                 "FROM tbl_clinic c " +
                 "INNER JOIN tbl_place p ON c.place_id = p.place_id " +
                 "INNER JOIN tbl_type t ON t.type_id = c.type_id " +
                 "WHERE c.clinic_vstatus = 1";

    if (pid != null && !pid.isEmpty()) {
        qry += " AND c.place_id = " + pid;
    }
    if (did != null && !did.isEmpty()) {
        qry += " AND p.district_id = " + did;
    }
    if (cid != null && !cid.isEmpty()) {
        qry += " AND t.type_id = " + cid;
    }

    ResultSet rs1 = con.selectCommand(qry);
%>

<style>
    .clinic-card {
        width: 300px;
        margin: 15px;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        display: inline-block;
        vertical-align: top;
    }
    .clinic-logo {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border-radius: 10px;
    }
    .clinic-name {
        font-size: 18px;
        font-weight: bold;
        margin-top: 10px;
    }
    .clinic-details {
        font-size: 14px;
        color: #555;
    }
    .rating {
        color: #FFD700;
        font-size: 16px;
    }
    .btn {
        display: inline-block;
        padding: 8px 12px;
        margin: 10px 5px;
        text-decoration: none;
        color: #fff;
        background-color: #007bff;
        border-radius: 5px;
    }
</style>

<div style="display: flex; flex-wrap: wrap; justify-content: center;">
<%
    while (rs1.next()) {
        String clinicId = rs1.getString("clinic_id");

        // Query to fetch the average rating for the clinic
        String ratingQuery = "SELECT AVG(user_rating) AS avg_rating FROM tbl_review WHERE clinic_id = " + clinicId;
        ResultSet rsRating = con.selectCommand(ratingQuery);
        double avgRating = 0.0;
        if (rsRating.next()) {
            avgRating = rsRating.getDouble("avg_rating");
        }

        // Generate star rating
        int fullStars = (int) avgRating;
        int halfStar = (avgRating - fullStars >= 0.5) ? 1 : 0;
%>
    <div class="clinic-card">
        <img src="../Assets/Files/ClinicDocs/<%=rs1.getString("clinic_logo")%>" class="clinic-logo" alt="Clinic Logo">
        <div class="clinic-name"><%= rs1.getString("clinic_name") %></div>
        <div class="clinic-details"><%= rs1.getString("clinic_address") %></div>
        <div class="clinic-details"><%= rs1.getString("type_name") %></div>
        <div class="clinic-details"><%= rs1.getString("clinic_contact") %></div>
        <div class="rating">
<%
        for (int i = 0; i < fullStars; i++) {
%>
            ★
<%
        }
        if (halfStar == 1) {
%>
            ☆
<%
        }
%>
        </div>
        <a href="ViewClinicDetails.jsp?hid=<%= clinicId %>" class="btn">View More</a>
        <a href="Apponitment.jsp?cid=<%= clinicId %>" class="btn">Book Appointment</a>
    </div>
<%
    }
%>
</div>
