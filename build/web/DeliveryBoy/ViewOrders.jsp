<%-- 
    Document   : ViewPresecription
    Created on : 28 Oct, 2024, 10:57:57 AM
    Author     : ADWAITHA SAJU
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Head.jsp" %>


<% 

    if(request.getParameter("aid")!= null)
    {
        String Up="update tbl_appointment set appointment_status='6' where appointment_id="+request.getParameter("aid");
        if(con.executeCommand(Up))
        {
            response.sendRedirect("ViewOrders.jsp");
        }
    }
    
    if(request.getParameter("oid")!= null)
    {
        String Up="update tbl_appointment set appointment_status='7' where appointment_id="+request.getParameter("oid");
        if(con.executeCommand(Up))
        {
            response.sendRedirect("ViewOrders.jsp");
        }
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
                <h1 align="center" class="card-title">Change Password</h1>
        <div class="card-body">
        <table align="center" border="1" class="table table-responsive table-bordered">
       
            <tr> 
                <td>SI</td>
                <td>User Name </td>
                <td>Email </td>
                <td>Contact </td>
                <td>Address </td>
                <td>Presecription </td>
                <td>Action</td>


            </tr>
            
           <%
           String pre=" select * from tbl_appointment a inner join tbl_user s on a.user_id=s.user_id where  deliveryboy_id="+session.getAttribute("did");
           ResultSet res=con.selectCommand(pre);
           int i=0;
           while(res.next())
           {
               i++;
               %>
               <tr>
                   <td><%= i %></td>
                   <td><%= res.getString("user_name") %></td>
                   <td><%= res.getString("user_email") %></td>
                   <td><%= res.getString("user_contact")%></td>
                   <td><%= res.getString("user_address") %></td>
                    <td><a href="../Assets/Files/PrecescriptionDocs/<%= res.getString("presecription_image")%>"><img src="../Assets/Files/PrecescriptionDocs/<%= res.getString("presecription_image")%>" width="100px" height="100px"></img></a></td>
                   
                   <td>
                       <% if(res.getInt("appointment_status") ==5) {
                       
                       %>
                       <a href="ViewOrders.jsp?aid=<%= res.getString("appointment_id") %>">Order Taken </a>
                       <%
                        }
                       else if(res.getInt("appointment_status") ==6) {
                       
                       %>
                       <a href="ViewOrders.jsp?oid=<%= res.getString("appointment_id") %>">Order Delivered </a>
                       <%
                        }
                      else if(res.getInt("appointment_status") ==7) {
                       
                       %>
                       Order Completed.
                       <%
                        }%>
                   </td>
                   
                   
                   
               </tr>
               <%
           }
           
           
           
           %>
        </table>
        </div>
            </div>
        </div>
    </body>
</html>
<%@include  file="Foot.jsp" %>