<%-- 
    Document   : Category
    Created on : 19 Aug, 2024, 12:01:45 PM
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
        <title>Category</title>
    </head>
    <body>
        <div class="container">
            <div class="card">

                <%
                    if (request.getParameter("btnsubmit") != null) {
                        String category_name = request.getParameter("txtcategory");
                        String id = request.getParameter("txt_id");
                        if (id == "") {
                            String insQry = "insert into tbl_category(category_name) values('" + category_name + "')";
                            out.println(insQry);
                            if (con.executeCommand(insQry)) {
                %>
                <script>
                    alert("Record Saved");
                    window.location = "Category.jsp";
                </script>
                <%
                    }
                } else {
                    String updQry = "update tbl_category set category_name='" + category_name + "' where category_id=" + id;
                    if (con.executeCommand(updQry)) {

                %>
                <script>
                    alert("Updated");
                    window.location = "Category.jsp";
                </script>
                <%                }
                        }
                    }


                %>

                <%            if (request.getParameter("did") != null) {
                        String delQry = "delete from tbl_category where category_id=" + request.getParameter("did");
                        if (con.executeCommand(delQry)) {
                %>
                <script>
                    alert("Deleted");
                    window.location = "Category.jsp";
                </script>
                <%
                        }
                    }
                    String cata = "";
                    String catId = "";
                    if (request.getParameter("eid") != null) {
                        String selEdit = "select * from tbl_category where category_id=" + request.getParameter("eid");
                        ResultSet rse = con.selectCommand(selEdit);
                        rse.next();
                        cata = rse.getString("category_name");
                        catId = rse.getString("category_id");
                    }
                %>


                <h1 align="center" class="card-title">Category</h1>
                <div class="card-body">
                    <form>
                        <input type="hidden" name="txt_id" value="<%=catId%>">
                        <table align="center" class="table table-responsive table-bordered">
                            <tr>
                                <td>Category</td>
                                <td><input type="txt" name="txtcategory" id="txtcategory" placeholder="Enter Your Category" required="required" value="<%=cata%>"><br></td>
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
            <th>Category</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <%
            String selQry = "select * from tbl_category";
            ResultSet rs = con.selectCommand(selQry);
            int i = 0;
            while (rs.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs.getString("category_name")%></td>
            <td><a href="Category.jsp?did=<%= rs.getString("category_id")%>">Delete</a> || <a href="Category.jsp?eid=<%= rs.getString("category_id")%>">Edit</a></td>
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