<%-- 
    Document   : ViewComplaint
    Created on : 28 Sep, 2024, 12:10:53 PM
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
        <div class="container">
            <div class="card">
        
        <h1 align="center" class="card-title">User complaints</h1>
        <div class="card-body">
<table border="1" align="center" class="table table-responsive table-bordered">
    <thead>
        
        <tr>  
            <th>Sl.No</th>
            <th>Title</th>
            <th>Content</th>
            <th>Date</th>
            <th>Name</th>
            <th>Clinic Name</th>
            <th>Contact</th>
            
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <%
             String selQry1 = "select * from tbl_complaint c inner join tbl_user u on c.user_id = u.user_id inner join  tbl_clinic cl on c.clinic_id = cl.clinic_id where c.complaint_status=0 ";
            ResultSet rs1 = con.selectCommand(selQry1);
            int i = 0;
            while (rs1.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs1.getString("complaint_title")%></td>
            <td><%= rs1.getString("complaint_content")%></td>
            <td><%= rs1.getString("complaint_date")%></td>
            <td><%= rs1.getString("user_name")%></td>
            <td><%= rs1.getString("clinic_name")%></td>
            <td><%= rs1.getString("user_contact")%></td>
            
            
            <td><a href="Reply.jsp?uid=<%= rs1.getString("complaint_id")%>">Reply</a></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
   
        </div></div>
        </div>
    </body>
</html>

<%@include  file="Foot.jsp" %>