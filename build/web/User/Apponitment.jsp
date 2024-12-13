<%-- 
    Document   : Apponitment
    Created on : 20 Sep, 2024, 3:25:38 PM
    Author     : ADWAITHA SAJU
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.time.LocalDate" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Head.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appoitment</title>
    </head>
    <body>

        <div class="container">
            <div class="card">


                <%
                    if (request.getParameter("btnsubmit") != null) {
                        String fordate = request.getParameter("fordate");
                        String slot = request.getParameter("slot");
                        String token = request.getParameter("token");
                        String amount = request.getParameter("amount");
                        String availabilityId = request.getParameter("selslot");
                        String type = request.getParameter("app_type");
                        String insQry = "insert into tbl_appointment(appointment_fordate,appointment_token,appointment_amount,user_id,availability_id,appointment_date,appointment_type) values('" + fordate + "','" + token + "','" + amount + "','" + session.getAttribute("uid") + "','" + availabilityId + "',curdate(),'"+type+"')";
                        //out.println(insQry);
                        if (con.executeCommand(insQry)) {
                %>
                <script>
                    window.location = "Payment.jsp";
                </script>
                <%
                        }
                    }

                %>



                <h1 align="center" class="card-title">Appointment</h1>
                 <div class="card-body">


                     <form method="post" align="center">
                    <table align="center" class="table table-responsive table-bordered"  >
                       

                            <tr>
                                <td>ForDate</td>
                                <td><input type="date" class="form-control"  name="fordate" id="fordate" min="<%= LocalDate.now()%>" placeholder="Enter fordate"  required="required"></td>
                            </tr>
                            
                            <tr>
                                <td>Appointment Type</td>
                                <td><input type="radio"  name="app_type" id="fordate" required="required" value="0"> Offline <input value="1" type="radio"   name="app_type" id="fordate" required="required"> Online</td>
                            </tr> 


                            <tr>
                                <td>TimeSlot</td>
                                <td>


                                    <select class="form-control" name="selslot" id="selslot" onchange="getToken()">
                                        <option name="--select--">...Select</option>

                                        <%
                                            String selQry1 = "select * from tbl_availability where clinic_id='" + request.getParameter("cid")+"' ";
                                            ResultSet rs1 = con.selectCommand(selQry1);
                                            while (rs1.next()) {
                                        %>

                                        <option value="<%=rs1.getString("availability_id")%>"><%=rs1.getString("availability_stime")%> - <%=rs1.getString("availability_etime")%></option>

                                        <%
                                            }
                                        %>

                                    </select>



                            </tr>


                            <tr>
                                <td>Token</td>
                                <td><input class="form-control" type="text" name="token" id="token" required="required" readonly=""><br></td>
                            </tr>

                            <tr>
                                <td>Amount</td>
                                <td><input class="form-control type="text" name="amount" id="amount" placeholder="Enter amount" required="required" readonly="" value="100"><br></td>
                            </tr>


                            <tr>
                                <td colspan="2" align="center"><input type="submit" class="btn btn-primary"  id="btnsubmit" name="btnsubmit" value="Submit"></td>
                            </tr>
                    </table>
           
                 </form>
                                    </div>

                                        
                                        <script src="../Assets/JQ/jQuery.js"></script>
        <script>

                                        function getToken()
                                        {
                                            var date = document.getElementById("fordate").value;
                                            var avl = document.getElementById("selslot").value;
                                            if (date == "") {
                                                alert("Select A Date")
                                            }
                                            else {
                                                $.ajax({
                                                    url: "../Assets/AjaxPages/AjaxToken.jsp?date=" + date + "&avl=" + avl,
                                                    success: function(result) {
                                                        document.getElementById("token").value = result;
                                                    }
                                                });
                                            }
                                        }
        </script>

    </div>
</div>

</body>
</html>


<%@include  file="Foot.jsp" %>
