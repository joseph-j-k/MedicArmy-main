<%-- 
    Document   : Reply
    Created on : 28 Sep, 2024, 12:17:44 PM
    Author     : ADWAITHA SAJU
--%>
<%@include  file="Head.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="card">



                <%
                    if (request.getParameter("btnsubmit") != null) {
                        String UpQry = "update  tbl_complaint set complaint_status=1, complaint_reply='" + request.getParameter("txtcontent") + "',reply_date=curdate() where complaint_id=" + request.getParameter("uid");
       //                out.print(UpQry);
                        if (con.executeCommand(UpQry)) {
                %>
                <script>
                    alert("Updated");
                    //window.location = "Reply.jsp";
                </script>
                <%
                        }
        //                else{
        //                    out.print("Failed");
        //                }
                    }
                %>

                <h1 align="center" class="card-title">Reply</h1>
                <div class="card-body">
                    <form method="post">
                        <table align="center" class="table table-responsive table-bordered">

                            <tr>
                                <td>Content</td>
                                <td><textarea  name="txtcontent" id="txtcontent" placeholder="Enter Your Content" required="required"></textarea><br></td>
                            </tr>



                            <tr>
                                <td colspan="2" align="center"><input type="submit"  id="btnsubmit" name="btnsubmit" value="Submit"></td>
                            </tr>

                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

<%@include  file="Foot.jsp" %>
