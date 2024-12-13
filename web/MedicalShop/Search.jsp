<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .custom-alert-box{
                width: 20%;
                height: 10%;
                position: fixed;
                bottom: 0;
                right: 0;
                left: auto;
                z-index: 1;
            }

            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
                display: none;
            }

            .failure {
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
                display: none;
            }

            .warning {
                color: #8a6d3b;
                background-color: #fcf8e3;
                border-color: #faebcc;
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="custom-alert-box">
            <div class="alert-box success">Successful Added to Cart !!!</div>
            <div class="alert-box failure">Failed to Add Cart !!!</div>
            <div class="alert-box warning">Already Added to Cart !!!</div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <h5>Filter Product</h5>
                    
                    <hr>
                    
                    <h6> Search </h6>
                    <form method="post">
                        <ul> <input type="text" name="name" id="name" onkeyup="productCheck(this.value)" >
                            <input type="hidden" name="aid" id="aid" value="<%= request.getParameter("aid") %>" >
                        </ul>
                    </form>
                    <h6 class="text-info"> Select Category</h6>
                    <ul class="list-group">
                        <%                            String selD = "SELECT * from tbl_category";
                            ResultSet rsD = con.selectCommand(selD);
                            while (rsD.next()) {
                        %>
                        <li class="list-group-item">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input product_check" value="<%=rsD.getString("category_id")%>" id="category" onclick="productCheck(),getsubcategory()"><%=rsD.getString("category_name")%>
                                </label>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                    <h6 class="text-info"> Select SubCategory</h6>
                    <ul class="list-group" id="subcategory">
                        
                    </ul>
                    
                   
                    
                    
                </div>
                <div class="col-lg-9">
                    <h5 class="text-center" id="textChange">All Products</h5>
                    <hr>
                    <div align="right"><a href="MyCart.jsp?aid=<%=request.getParameter("aid")%>">Cart</a></div>
                    <div class="text-center">
                        <img src="../Assets/Template/loader.gif" id='loder' width="200" style="display: none"/>
                    </div>
                    <div class="row" id="result">

                        <%
                            String selProduct = "select * from tbl_medicine m inner join tbl_subcategory sc on m.subcategory_id=sc.subcategory_id inner join tbl_category c on sc.category_id=c.category_id where m.shop_id="+session.getAttribute("sid");
                            
                            ResultSet rsP = con.selectCommand(selProduct);
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
                        %>
                    </div>

                </div>

            </div>
        </div>

        <script>

            function addCart(id)
            {
                var aid=document.getElementById("aid").value
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxAddCart.jsp?id=" + id +"&aid="+aid,
                    success: function(response) {
                        if (response.trim() === "Added to Cart")
                        {
                            $("div.success").fadeIn(300).delay(1500).fadeOut(400);
                        }
                        else if (response.trim() === "Already Added to Cart")
                        {
                            $("div.warning").fadeIn(300).delay(1500).fadeOut(400);
                        }
                        else
                        {
                            $("div.failure").fadeIn(300).delay(1500).fadeOut(400);
                        }
                    }
                });
            }
            function buyNow(id, amt)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxBuy.jsp?id=" + id + "&amt=" + amt,
                    success: function(response) {
                        if (response !== "false")
                        {
                            window.location = "Payment.jsp";
                        }

                    }
                });
            }
            
            function get_filter_text(text_id)
                {
                    var filterData = [];

                    $('#' + text_id + ':checked').each(function() {
                        filterData.push($(this).val());
                    });
                    return filterData;
                }
            
            function productCheck(){
                    $("#loder").show();

                    var action = 'data';
                    var category = get_filter_text('category');
                    var subcategory = get_filter_text('subcategory');
					var name = document.getElementById('name').value;
					


                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxSearch.jsp?action=" + action +"&category=" + category+"&subcategory=" + subcategory+"&name=" + name ,
                        success: function(response) {
                            $("#result").html(response);
                            $("#loder").hide();
                            $("#textChange").text("Filtered Products");
                        }
                    });


                }
                
            
            
            function getsubcategory(){
                var did = get_filter_text('category');
                $.ajax({
                        url: "../Assets/AjaxPages/AjaxSearchSubCategory.jsp?did=" + did,
                        success: function(result) {
                            $("#subcategory").html(result);

                        }
                    });
            }
            
            
              
                
            
        </script>
    </body>
</html>

                      
                    