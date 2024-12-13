<%-- 
    Document   : DeliveryMyProfile
    Created on : 18 Sep, 2024, 3:21:30 PM
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
        <title>MyProfile</title>
    </head>
    <body>
        <h1 align="center">MyProfile</h1>
        
        <%
            String SelQry = " select * from tbl_deliveryboy   where deliveryboy_id="+ session.getAttribute("did");
            ResultSet rs = con.selectCommand(SelQry);
            if(rs.next()){
        %>
        <form>
            <table align="center" border="1">
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("deliveryboy_name")%></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("deliveryboy_address")%></td>
                </tr>


                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("deliveryboy_email")%></td>
                </tr>

                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("deliveryboy_contact")%></td>
                </tr>
                

                 <tr>
                    <td colspan="2" align="center">
                        <a href="DeliveryEditProfile.jsp">EditProfile</a> || 
                        <a href="DeliveryChangePassword.jsp">ChangePassword</a>
                </tr>
                
            </table>
        </form>
                <%
                }
            %>
    </body>
</html>

    </body>
</html>
<%@include  file="Foot.jsp" %>
