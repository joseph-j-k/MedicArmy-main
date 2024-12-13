<%-- 
    Document   : AjaxPlace
    Created on : 28 Oct, 2024, 10:31:03 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
                                String place = "SELECT * FROM tbl_subcategory where category_id in ("+request.getParameter("did")+")";
                                
                                ResultSet rsa = con.selectCommand(place);
                                while (rsa.next()) {
                            %>
                            <li class="list-group-item">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input product_check" value="<%=rsa.getString("subcategory_id")%>" onchange="productCheck()" id="subcategory"><%=rsa.getString("subcategory_name")%>
                                </label>
                            </div>
                        </li>
                            <%
                                }
                            %>