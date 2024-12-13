<%-- 
    Document   : ShopMyProfile
    Created on : 20 Sep, 2024, 11:10:01 AM
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
            String SelQry = " select * from tbl_shop d inner join tbl_place p on d.place_id = p.place_id  where d.shop_id="+ session.getAttribute("sid");
            ResultSet rs = con.selectCommand(SelQry);
            if(rs.next()){
        %>
        <form>
            <table align="center" border="1">
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("shop_name")%></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("shop_address")%></td>
                </tr>


                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("shop_email")%></td>
                </tr>

                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("shop_contact")%></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><%=rs.getString("place_name")%></td>
                </tr>

               <tr>
                    <td colspan="2" align="center">
                        <a href="DeliveryEditProfile.jsp">EditProfile</a> || 
                        <a href="DeliveryChangePassword.jsp">ChangePassword</a>
                </tr>
                
            </table>
                <a href="Stock.jsp"></a>
        </form>
                <%
                }
            %>
    </body>
</html>

    </body>
</html>

   
<center>     
    <a href="HomePage.jsp">Back</a>
</center>

<%@include  file="Foot.jsp" %>
