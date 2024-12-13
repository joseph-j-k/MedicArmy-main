<%-- 
    Document   : ShopEditProfile
    Created on : 20 Sep, 2024, 11:10:27 AM
    Author     : ADWAITHA SAJU
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
  <%@page import="java.sql.ResultSet"%>  
  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Head.jsp" %>

<!DOCTYPE html>
<%
    String dName = "";
    String dEmail = "";
    String dContact = "";
    String dAddress = "";

    if (request.getParameter("btnsubmit") != null) {
        dName = request.getParameter("txtname");
        dEmail = request.getParameter("txtemail");
        dContact = request.getParameter("txtcontact");
        dAddress = request.getParameter("txtaddress");

        String updQry = "update tbl_shop set shop_name='" + dName + "',shop_email='" + dEmail + "',shop_contact='" + dContact + "',shop_address='" + dAddress + "' where shop_id=" + session.getAttribute("sid");
        if (con.executeCommand(updQry)) 
        {
%>
<script>
    alert("UPDATED")
    window.location = "ShopEditProfile.jsp";
</script>
<%
} else {
%>
<script>
    alert("Failed")
</script>
<%
        }
    }

    String SelQry = "select * from tbl_shop d inner join tbl_place p on p.place_id=d.place_id  where d.shop_id=" + session.getAttribute("sid");
//    out.print(SelQry);
    ResultSet rs = con.selectCommand(SelQry);
    if (rs.next()) {
%>
<body>
    <div class="container">
        <div class="card">

<form method="post">
 <h1 align="center" class="card-title">Edit Profile</h1>
        <div class="card-body">
    <table align="center" border="1" class="table table-responsive table-bordered">

        <tr>
            <td>Name</td>
            <td><input type="text" name="txtname" value="<%=rs.getString("shop_name")%>" ></td>
        </tr>    

        <tr>
            <td>Email</td>
            <td><input type="text" name="txtemail" value="<%=rs.getString("shop_email")%>"></td>
        </tr>

        <tr>
            <td>Contact number</td>
            <td><input type="text" name="txtcontact" value="<%=rs.getString("shop_contact")%>"></td>
        </tr>

        <tr>
            <td>Address</td>
            <td><input type="text" name="txtaddress" value="<%=rs.getString("shop_address")%>"></td>
        </tr>

        <td colspan="2" align="center">
            <input type="submit" name="btnsubmit" value="UPDATE">
        </td>

    </table>
        <div>
</form>
         <%
    }
    else{
        out.print("ERROR!!!!");
    }
            %>
            
         </div>
        </div>
</body>

   
<center>     
    <a href="HomePage.jsp">Back</a>
</center>

<%@include  file="Foot.jsp" %>