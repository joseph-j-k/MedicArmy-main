<%-- 
    Document   : District
    Created on : 19 Aug, 2024, 11:38:11 AM
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
        <title>District</title>
    </head>
    <body>
        <div class="container">
            <div class="card">

                <%
                    if (request.getParameter("btnsubmit") != null) {
                        String districtName = request.getParameter("txtdistrict");
                        String id = request.getParameter("txt_id");
                        if (id == "") {
                            String insQry = "insert into tbl_district(district_name) values('" + districtName + "')";
                            out.println(insQry);
                            if (con.executeCommand(insQry)) {
                %>
                <script>
                    alert("Record Saved");
                    window.location = "District.jsp";
                </script>
                <%
                    }
                } else {
                    String updQry = "update tbl_district set district_name='" + districtName + "' where district_id=" + id;
                    if (con.executeCommand(updQry)) {

                %>
                <script>
                    alert("Updated");
                    window.location = "District.jsp";
                </script>
                <%                }
                        }
                    }


                %>
                <%            if (request.getParameter("did") != null) {
                        String delQry = "delete from tbl_district where district_id=" + request.getParameter("did");
                        if (con.executeCommand(delQry)) {
                %>
                <script>
                    alert("Deleted");
                    window.location = "District.jsp";
                </script>
                <%
                        }
                    }

                    String dist = "";
                    String distId = "";
                    if (request.getParameter("eid") != null) {
                        String selEdit = "select * from tbl_district where district_id=" + request.getParameter("eid");
                        ResultSet rse = con.selectCommand(selEdit);
                        rse.next();
                        dist = rse.getString("district_name");
                        distId = rse.getString("district_id");
                    }
                %>




                <h1 align="center" class="card-title">District</h1>
                <div class="card-body">
                    <form method="post">
                        <input type="hidden" name="txt_id" value="<%=distId%>">
                        <table align="center" class="table table-responsive table-bordered">
                            <tr>
                                <td>District</td>
                                <td><input type="txt" name="txtdistrict" value="<%=dist%>"<br></td>
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



<table border="1" align="center">
    <thead>
        <tr>
            <th>Sl.No</th>
            <th>District</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            String selQry = "select * from tbl_district";
            ResultSet rs = con.selectCommand(selQry);
            int i = 0;
            while (rs.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs.getString("district_name")%></td>
            <td><a href="District.jsp?did=<%= rs.getString("district_id")%>">Delete</a> || <a href="District.jsp?eid=<%= rs.getString("district_id")%>">Edit</a></td>
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