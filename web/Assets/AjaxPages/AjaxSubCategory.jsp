<%-- 
    Document   : AjaxSubCategory
    Created on : 19 Sep, 2024, 11:50:55 AM
    Author     : ADWAITHA SAJU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">---select---</option>
<%
    String sel="select * from tbl_subcategory where category_id='" +request.getParameter("cid") + "'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("subcategory_id")%>"><%=rs.getString("subcategory_name")%></option>
        <%
    }
%>