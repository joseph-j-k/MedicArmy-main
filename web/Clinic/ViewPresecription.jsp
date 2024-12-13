<%-- 
    Document   : ViewPresecription
    Created on : 28 Oct, 2024, 10:57:57 AM
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
        <div class="container"
             <div class="card">
                <h1 align="center" class="card-title">Presecription</h1>
                <div class="card-body">

                    <form>
                        <table border="1" align="center" class="table table-responsive table-bordered
                               <tr> 
                               <td>SI</td>
                               <td>MedicalShop Name </td>
                               <td>Email </td>
                               <td>Contact </td>
                               <td>Address </td>
                               <td>Presecription </td>


                               </tr>

                               <%
                                   String pre = " select * from tbl_appointment a inner join tbl_shop s on a.shop_id=s.shop_id where appointment_id=" + request.getParameter("aid");
                                   ResultSet res = con.selectCommand(pre);
                                   int i = 0;
                                   while (res.next()) {
                                       i++;
                               %>
                               <tr>
                               <td><%= i%></td>
                               <td><%= res.getString("shop_name")%></td>
                               <td><%= res.getString("shop_email")%></td>
                               <td><%= res.getString("shop_contact")%></td>
                               <td><%= res.getString("shop_address")%></td>
                                <td><a href="../Assets/Files/PrecescriptionDocs/<%= res.getString("presecription_image")%>"><img src="../Assets/Files/PrecescriptionDocs/<%= res.getString("presecription_image")%>" width="100px" height="100px"></img></a></td>


                             
                            </tr>
                            <%
                                }


                            %>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
<%@include  file="Foot.jsp" %>
