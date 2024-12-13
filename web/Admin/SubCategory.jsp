<%-- 
    Document   : SubCategory
    Created on : 19 Aug, 2024, 12:06:46 PM
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
        <title>SubCategory</title>
    </head>
    <body>
        <div class="container">
            <div class="card">
        <h1 align="center" class="card-title">SubCategory</h1>
        <div class="card-body">
        
         <%
            if (request.getParameter("btnsubmit") != null) {
                String categoryID = request.getParameter("selcategory");
                String subcategoryName = request.getParameter("txtsubcategory");
                String insQry = "insert into tbl_subCategory(subcategory_name,category_id) values('" + subcategoryName + "','" + categoryID + "')";
                out.println(insQry);
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "SubCategory.jsp";
        </script>
        <%
                }
            }
        %>
        
        
        <%
            if (request.getParameter("did") != null) {
                String delQry = "delete from tbl_subcategory where subcategory_id=" + request.getParameter("did");
                if (con.executeCommand(delQry)) {
        %>
        
        <script>
            alert("Deleted");
            window.location = "SubCategory.jsp";
        </script>
        <%
                }
            }
        %>
        
        
        <form>
            <table align="center" class="table table-responsive table-bordered">
                <tr>
                 <td>Category</td>
                 <td>
                     <select name="selcategory">
                            <option name="--select--">...Select</option>
                            <%
                                String selQry = "select * from tbl_category";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>

                            <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>

                            <%
                                }
                            %>

                 </td>
                </tr>
                
                <tr>
                    <td>SubCategory</td>
                    <td><input type="txt" name="txtsubcategory" id="txtsubcategory" placeholder="Enter Your subcategory" required="required"><br></td>
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
            <th>Category</th>
            <th>Subcategory</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            String selQry1 = "select * from tbl_subcategory s inner join tbl_category c on s.category_id=c.category_id";
            ResultSet rs1 = con.selectCommand(selQry1);
            int i = 0;
            while (rs1.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs1.getString("category_name")%></td>
            <td><%= rs1.getString("subcategory_name")%></td>
            <td><a href="SubCategory.jsp?did=<%= rs1.getString("subcategory_id")%>">Delete</a></td>
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