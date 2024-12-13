
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String id = request.getParameter("id");
    String selQry = "select count(*) as count from tbl_appointment where shop_id='" + session.getAttribute("sid") + "' and appointment_id='"+ request.getParameter("aid") +"' ";
    ResultSet rsC = con.selectCommand(selQry);
    rsC.next();
    if (Integer.parseInt(rsC.getString("count")) > 0) {
        String sel = "select appointment_id as id from tbl_appointment where shop_id='" + session.getAttribute("sid") + "'and appointment_id='"+ request.getParameter("aid") +"' ";
        ResultSet rs = con.selectCommand(sel);
        if (rs.next()) {
            String sqlQry = "select count(*) as count from tbl_cart where appointment_id='" + rs.getString("id") + "' and medicine_id='" + id + "'";
            ResultSet rsc = con.selectCommand(sqlQry);
            rsc.next();
            if (Integer.parseInt(rsc.getString("count")) > 0) {
                out.println("Already Added to Cart");
            } else {
                String insQry = "insert into tbl_cart(appointment_id,medicine_id)values('" + rs.getString("id") + "','" + id + "')";
                if (con.executeCommand(insQry)) {
                    out.println("Added to Cart");
                } else {
                    out.println("Failed to Add Cart");
                }
            }
        }
    } 
//    else {
//        String ins = "insert into tbl_appointment(shop_id)values('" + session.getAttribute("sid") + "')";
//        if (con.executeCommand(ins)) {
//            String sel = "select Max(appointment_id) as id from tbl_appointment";
//            ResultSet rs = con.selectCommand(sel);
//            if (rs.next()) {
//                String insQry = "insert into tbl_cart(appointment_id,medicine_id)values('" + rs.getString("id") + "','" + id + "')";
//                if (con.executeCommand(insQry)) {
//                    out.println("Added to Cart");
//                } else {
//                    out.println("Failed to Add Cart");
//                }
//            }
//        }
//    }


%>