<%-- 
    Document   : stock
    Created on : 29 Aug, 2024, 9:13:09 PM
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
        <title>Stock</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnsubmit") != null) {
                String quantity = request.getParameter("txtqty");
                
                String medicineId = request.getParameter("mid");
                String insQry = "insert into tbl_stock(stock_quantity,stock_date,medicine_id) values('" + quantity + "',curdate(),'" + medicineId + "')";
                //out.println(insQry);
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Stock.jsp?mid=<%= request.getParameter("mid") %>";
        </script>
        <%
                }
            }
            
            
        %>

        <%
            if (request.getParameter("did") != null) {
                String delQry = "delete from tbl_stock where stock_id=" + request.getParameter("did");
                if (con.executeCommand(delQry)) {
        %>
        <script>
            alert("Deleted");
            window.location = "Stock.jsp";
        </script>
        <%
                }
            }
        %>





        <h1 align="center">Stock</h1>
        <form method="post">
            <table align="center">

                <tr>
                    <td>Quantity</td>
                    <td><input type="text" name="txtqty" id="txtqty" placeholder="Enter Quantity" required="required"><br></td>
                </tr>

              

                <tr>
                    <td colspan="2" align="center"><input type="submit"  id="btnsubmit" name="btnsubmit" value="Submit"></td>
                </tr>
            </table>
        </form>

    </body>
</html>


<table border="1" align="center">
    <thead>
        <tr>  
            <th>Sl.No</th>
            <th>Quantity</th>
            <th>Date</th>
            <th>Medicine</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <%
             String selQry1 = "select * from tbl_stock t inner join tbl_medicine m on t.medicine_id=m.medicine_id where t.medicine_id="+request.getParameter("mid");
            ResultSet rs1 = con.selectCommand(selQry1);
            int i = 0;
            while (rs1.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%= rs1.getString("stock_quantity")%></td>
            <td><%= rs1.getString("stock_date")%></td>
            <td><%= rs1.getString("medicine_name")%></td>
            <td><a href="Stock.jsp?did=<%= rs1.getString("stock_id")%>">Delete</a></td>
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
