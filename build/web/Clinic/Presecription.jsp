<%-- 
    Document   : Presecription
    Created on : 27 Oct, 2024, 4:35:19 PM
    Author     : ADWAITHA SAJU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Head.jsp" %>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/PresecriptionUpload.jsp">
             <h1 align="center" class="card-title">Sent Presecription</h1>
                <div class="card-body">
                
            <input type="hidden" name="txt_aid" value="<%=request.getParameter("aid")  %>">
        <table align="center" class="table table-responsive table-bordered">
            <tr>
                <td>  Presecription </td>
                <td> <input type="file" class="form-control-file" name="image"> </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input class="btn btn-primary" type="submit" name="send" value="Send" ></td>
            </tr>
            
        </table>
        </div>
        </form>
        </div>
    </div>
    </body>
</html>
<%@include  file="Foot.jsp" %>