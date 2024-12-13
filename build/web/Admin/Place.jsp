<%-- 
    Document   : Place
    Created on : 19 Aug, 2024, 11:43:49 AM
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
        <title align="center">Place</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h1 align="center" class="card-title">Place</h1>
                <div class="card-body">
                    <%
                        if (request.getParameter("btnsubmit") != null) {
                            String districtID = request.getParameter("seldistrict");
                            String placename = request.getParameter("txtplace");
                            String id = request.getParameter("txt_id");
                            if (id == "") {
                                String insQry = "insert into tbl_place(place_name,district_id) values('" + placename + "','" + districtID + "')";
                                //out.println(insQry);
                                if (con.executeCommand(insQry)) {
                    %>
                    <script>
                        alert("Record Saved");
                        window.location = "Place.jsp";
                    </script>
                    <%
                        }
                    } else {
                        String updQry = "update tbl_place set place_name='" + placename + "' where place_id=" + id;
                        if (con.executeCommand(updQry)) {

                    %>
                    <script>
                        alert("Updated");
                        window.location = "Place.jsp";
                    </script>
                    <%                    }
                            }
                        }


                    %>






                    <%            if (request.getParameter("did") != null) {
                            String delQry = "delete from tbl_place where place_id=" + request.getParameter("did");
                            if (con.executeCommand(delQry)) {
                    %>
                    <script>
                        alert("Deleted");
                        window.location = "Place.jsp";
                    </script>
                    <%
                            }
                        }

                        String place = "";
                        String placeId = "";
                        if (request.getParameter("eid") != null) {
                            String selEdit = "select * from tbl_place where place_id=" + request.getParameter("eid");
                            ResultSet rse = con.selectCommand(selEdit);
                            rse.next();
                            place = rse.getString("place_name");
                            placeId = rse.getString("place_id");
                        }
                    %>


                    <form>
                        <input type="hidden" name="txt_id" value="<%=placeId%>">
                        <table align="center" class="table table-responsive table-bordered">
                            <tr>
                                <td>District</td>
                                <td>


                                    <select name="seldistrict">
                                        <option name="--select--">...Select</option>

                                        <%
                                            String selQry = "select * from tbl_district";
                                            ResultSet rs = con.selectCommand(selQry);
                                            while (rs.next()) {
                                        %>

                                        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>

                                        <%
                                            }
                                        %>

                                    </select>



                            </tr>

                            <tr>
                                <td>Place</td>

                                <td><input type="txt" name="txtplace" id="txtplace" placeholder="Enter Your Place" required="required" value="<%=place%>"<br></td>
                            </tr>

                            <tr>
                                <td colspan="2" align="center"><input type="submit"  id="btnsubmit" name="btnsubmit" value="submit"></td>
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
            <th>Place</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            String selQry1 = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
            ResultSet rs1 = con.selectCommand(selQry1);
            int i = 0;
            while (rs1.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs1.getString("district_name")%></td>
            <td><%= rs1.getString("place_name")%></td>
            <td><a href="Place.jsp?did=<%= rs1.getString("place_id")%>">Delete</a> || <a href="Place.jsp?eid=<%= rs1.getString("place_id")%>">Edit</a></td>
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