<%-- 
    Document   : ClinicEditProfile
    Created on : 18 Sep, 2024, 12:05:19 PM
    Author     : ADWAITHA SAJU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Head.jsp" %>

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

        String updQry = "update tbl_clinic set clinic_name='" + dName + "',clinic_email='" + dEmail + "',clinic_contact='" + dContact + "',clinic_address='" + dAddress + "' where clinic_id=" + session.getAttribute("cid");
        if (con.executeCommand(updQry)) {%>
<script>
    alert("UPDATED")
    window.location = "ClinicEditProfile.jsp";
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

    String SelQry = "select * from tbl_clinic c inner join tbl_place p on p.place_id=c.place_id  where c.clinic_id=" + session.getAttribute("cid");
//    out.print(SelQry);
    ResultSet rs = con.selectCommand(SelQry);
    if (rs.next()) {
%>


<form method="post">

    <table border="1">

        <tr>
            <td>Name</td>
            <td><input type="text" name="txtname" value="<%=rs.getString("clinic_name")%>" ></td>
        </tr>    

        <tr>
            <td>Email</td>
            <td><input type="text" name="txtemail" value="<%=rs.getString("clinic_email")%>"></td>
        </tr>

        <tr>
            <td>Contact number</td>
            <td><input type="text" name="txtcontact" value="<%=rs.getString("clinic_contact")%>"></td>
        </tr>

        <tr>
            <td>Address</td>
            <td><input type="text" name="txtaddress" value="<%=rs.getString("clinic_address")%>"></td>
        </tr>

        <td colspan="2" align="center">
            <input type="submit" name="btnsubmit" value="UPDATE">
        </td>

    </table>
</form>
         <%
    }
    else{
        out.print("ERROR!!!!");
    }
            %>
</body>


   
<center>     
    <a href="HomePage.jsp">Back</a>
</center>
<%@include  file="Foot.jsp" %>