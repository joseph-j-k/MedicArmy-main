<%-- 
    Document   : Type
    Created on : 27 Aug, 2024, 10:15:04 PM
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
        <title>Type</title>
    </head>
    <body>
        <div class="container">
            <div class="card">

        <%
            if (request.getParameter("btnsubmit") != null) {
                String typeName = request.getParameter("txttype");
                String id = request.getParameter("txt_id");
                if (id == "") {
                String insQry = "insert into tbl_type(type_name) values('" + typeName + "')";
                out.println(insQry);
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Type.jsp";
        </script>
        <%
                }
            }else {
            String updQry = "update tbl_type set type_name='" + typeName + "' where type_id=" + id;
            if (con.executeCommand(updQry)) {

        %>
        <script>
            alert("Updated");
            window.location = "Type.jsp";
        </script>
        <%                }
                }
            }


        %>


        <%
            if (request.getParameter("did") != null) {
                String delQry = "delete from tbl_type where type_id=" + request.getParameter("did");
                if (con.executeCommand(delQry)) {
        %>
        <script>
            alert("Deleted");
            window.location = "Type.jsp";
        </script>
        <%
                }
            }
            String typ = "";
            String typId = "";
            if (request.getParameter("eid") != null) {
                String selEdit = "select * from tbl_type where type_id=" + request.getParameter("eid");
                ResultSet rse = con.selectCommand(selEdit);
                rse.next();
                typ = rse.getString("type_name");
                typId = rse.getString("type_id");
            }
        %>

        <h1 align="center" class="card-title">Type</h1>
        <div class="card-body">
        <form method="post">
            <input type="hidden" name="txt_id" value="<%=typId%>">
            <table align="center"class="table table-responsive table-bordered" >
                <tr>
                    <td>Type</td>
                    <td><input type="txt" name="txttype" id="txttype" placeholder="Enter Your Type" required="required" value="<%=typ%>"><br></td>
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

</body>
</html>

<table border="1" align="center">
    <thead>
        <tr>
            <th>Sl.No</th>
            <th>Type</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            String selQry = "select * from tbl_type";
            ResultSet rs = con.selectCommand(selQry);
            int i = 0;
            while (rs.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs.getString("type_name")%></td>
            <td><a href="Type.jsp?did=<%= rs.getString("type_id")%>">Delete</a> || <a href="Type.jsp?eid=<%= rs.getString("type_id")%>">Edit</a></td> 
</tr>
<%
    }
%>

</tbody>
</table>

<center>     
    <a href="HomePage.jsp">HomePage</a>
</center>
<%@include  file="Foot.jsp" %>

