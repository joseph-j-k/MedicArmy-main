<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("action") != "") {

        String sqlQry = "select * from tbl_medicine m inner join tbl_subcategory sc on m.subcategory_id=sc.subcategory_id inner join tbl_category c on sc.category_id=c.category_id where m.shop_id='"+session.getAttribute("sid")+"' and true";
        String row = "SELECT count(*) as count from tbl_medicine m inner join tbl_subcategory sc on m.subcategory_id=sc.subcategory_id inner join tbl_category c on sc.category_id=c.category_id where m.shop_id='"+session.getAttribute("sid")+"' and true";

        if(!request.getParameter("category").equals("")) {

            String category = request.getParameter("category");

            sqlQry += " AND sc.category_id IN(" + category + ")";
            row += " AND sc.category_id IN(" + category + ")";
        }
        
        
        
        if (!request.getParameter("subcategory").equals("")) {

            String subcategory = request.getParameter("subcategory");

            sqlQry += " AND m.subcategory_id IN(" +subcategory+ ")";
            row += " AND m.subcategory_id IN(" + subcategory + ")";
        }
        
         if (!request.getParameter("name").equals("")) {

            String name = request.getParameter("name");

            sqlQry += " AND m.medicine_name LIKE '%"+ name + "%' ";
            row += " AND m.medicine_name LIKE '"+ name + "%' ";
        }

        ResultSet rsP = con.selectCommand(sqlQry);
        ResultSet rsr = con.selectCommand(row);
        rsr.next();

        if (Integer.parseInt(rsr.getString("count")) > 0) {
            while (rsP.next()) {
%>
<div class="col-md-3 mb-2">
                            <div class="card-deck">
                                <div class="card border-secondary">
                                    <img src="../Assets/Files/MedicineDocs/<%=rsP.getString("medicine_image")%>" class="card-img-top" height="250">
                                    <div class="card-img-secondary">
                                        <h6  class="text-light bg-info text-center rounded p-1"><%=rsP.getString("medicine_name")%></h6>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title text-danger">
                                            Rate : <%=rsP.getString("medicine_rate")%>/-<br>
                                            
                                        </h4>
                                        <p>
                                            Category  : <%=rsP.getString("category_name")%><br>
                                            Sub Category : <%=rsP.getString("subcategory_name")%><br>
                                            
                                            
                                        </p>
                                        
                                        
                                        <%
                                            String stockSql = "select sum(stock_quantity) as stock from tbl_stock where medicine_id = '" + rsP.getString("medicine_id") + "'";
                                            ResultSet rsST = con.selectCommand(stockSql);
                                            rsST.next();
                                            if (rsST.getString("stock") != null) {
                                                int stock = Integer.parseInt(rsST.getString("stock"));
                                                if (stock > 0) {
                                        %>
                                        <a href="javascript:void(0)" onclick="addCart('<%=rsP.getString("medicine_id")%>')" class="btn btn-success btn-block">Add to Cart</a>
                                        <%
                                        } else if (stock == 0) {
                                        %>
                                        <a href="javascript:void(0)" class="btn btn-danger btn-block">Out of Stock</a>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <a href="javascript:void(0)" class="btn btn-warning btn-block">Stock Not Found</a>
                                        <%
                                            }
                                        %>
                                       

                                    </div>
                                </div>
                            </div>
                        </div>

<%
            }
        } else {
            out.println("<h4>Products Not Found!!!!</h4>");
        }
    }

%>