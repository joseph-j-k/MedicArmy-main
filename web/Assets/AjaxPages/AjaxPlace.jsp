<%-- 
    Document   : AjaxPlace
    Created on : 19 Sep, 2024, 10:22:04 AM
    Author     : ADWAITHA SAJU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">---select---</option>
<%
    String sel="select * from tbl_place where district_id='" +request.getParameter("cid") + "'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
        <%
    }
%>
