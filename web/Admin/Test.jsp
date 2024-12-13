<%-- 
    Document   : District
    Created on : 20 Aug, 2024, 1:58:45 PM
    Author     : Nandu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>District</title>
        </head>
    <%
        if (request.getParameter("btn_submit") != null) {
            String district = request.getParameter("txt_dist");
            String id = request.getParameter("txt_id");
            if (id == "") {
                String insQry = "insert into tbl_district(district_name) values('" + district + "')";
                if (con.executeCommand(insQry)) {
    %>
    <script>
        alert("Inserted");
        window.location = "Test.jsp";
    </script>
    <%
        }
    } else {
        String updQry = "update tbl_district set district_name='" + district + "' where district_id=" + id;
        if (con.executeCommand(updQry)) {
    %>
    <script>
        alert("Updated");
        window.location = "Test.jsp";
    </script>
    <%
                }
            }
        }

        if (request.getParameter("did") != null) {
            String delQry = "delete from tbl_district where district_id=" + request.getParameter("did");
            if (con.executeCommand(delQry)) {
    %>
    <script>
        alert("Deleted");
        window.location = "Test.jsp";
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
    <body>
        <form method="post">
            <input type="hidden" name="txt_id" value="<%=distId%>">
            <table border="1">
                <thead>
                    <tr>
                        <th>District</th>
                        <th><input type="text" name="txt_dist" value="<%=dist%>"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="btn_submit" value="Submit">
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <table border="1">
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
                    <td><a href="Test.jsp?did=<%= rs.getString("district_id")%>">Delete</a> || <a href="Test.jsp?eid=<%= rs.getString("district_id")%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </body>
</html>+