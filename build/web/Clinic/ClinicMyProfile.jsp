<%-- 
    Document   : MyProfile
    Created on : 18 Sep, 2024, 12:03:26 PM
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
            String SelQry = " select * from tbl_clinic c inner join tbl_place p on c.place_id = p.place_id  where c.clinic_id="+ session.getAttribute("cid");
            ResultSet rs = con.selectCommand(SelQry);
            if(rs.next()){
        %>
        <form>
            <table align="center" border="1">
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("clinic_name")%></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("clinic_address")%></td>
                </tr>


                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("clinic_email")%></td>
                </tr>

                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("clinic_contact")%></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><%=rs.getString("place_name")%></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <a href="ClinicEditProfile.jsp">EditProfile</a> || 
                        <a href="ClinicChangePassword.jsp">ChangePassword</a>
                </tr>
                
                
            </table>
        </form>
                <%
                }
            %>
    </body>
</html>

   
<center>     
    <a href="HomePage.jsp">Back</a>
</center>

<%@include  file="Foot.jsp" %>
