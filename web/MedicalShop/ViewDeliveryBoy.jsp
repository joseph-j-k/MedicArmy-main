<%-- 
    Document   : ViewDeliveryRegistration
    Created on : 20 Sep, 2024, 12:42:16 PM
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
        <title>Registered DeliveryBoy</title>
    </head>
    <body>
        <h1 align="center"> DeliveryBoy</h1>
        
         
        <% 
        if(request.getParameter("did") != null )
        {
            String UpQry="update tbl_appointment set deliveryboy_id='"+ request.getParameter("did") +"', appointment_status='5' where  appointment_id= "+ request.getParameter("aid");
            if(con.executeCommand(UpQry))
            {
                %>
                <script>
                    alert('Assigned ');
                    window.location="ViewOrder.jsp";
                    </script>
                <%
                
            }
        }
        %>
        
        
        
        
        
<table border="1" align="center">
    <thead>
        <tr>
            <th>Sl.No</th>
            <th>Name</th>
            <th>Address</th>
            <th>Email</th>
            <th>Contact</th>
            
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <%
            String selQry1 = "select * from tbl_deliveryboy  where shop_id="+ session.getAttribute("sid");
            ResultSet rs1 = con.selectCommand(selQry1);
            int i = 0;
            while (rs1.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs1.getString("deliveryboy_name")%></td>
            <td><%= rs1.getString("deliveryboy_address")%></td>
            <td><%= rs1.getString("deliveryboy_email")%></td>
            <td><%= rs1.getString("deliveryboy_contact")%></td>
        
            


            <td><a href="ViewDeliveryBoy.jsp?did=<%= rs1.getString("deliveryboy_id")%>&aid=<%= request.getParameter("aid") %>">Assign</a>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
    
    
    
            




    </body>
</html>

<%@include  file="Foot.jsp" %>
