

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("action").equals("Delete")) {
        String id = request.getParameter("id");
        String delQry = "delete from tbl_cart where cart_id='" + id + "'";
        con.executeCommand(delQry);
    }
    if (request.getParameter("action").equals("Update")) {
        String id = request.getParameter("id");
        String qty = request.getParameter("qty");
        String upQry = "update tbl_cart set cart_quantity = '" + qty + "' where cart_id='" + id + "'";
        con.executeCommand(upQry);
    }
    if ("Emergency".equals(request.getParameter("action"))) {
        String id = request.getParameter("id");
        String status = request.getParameter("status"); 
        String upQry = "update tbl_cart set emg_status = '" + status + "' where cart_id='" + id + "'";
        con.executeCommand(upQry);
        
    }
%>