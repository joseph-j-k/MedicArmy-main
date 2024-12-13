<%-- 
    Document   : Login
    Created on : 19 Aug, 2024, 12:46:59 PM
    Author     : ADWAITHA SAJU
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>





<%
    if (request.getParameter("btnlogin") != null) {

        String email = request.getParameter("txtemail");
        String password = request.getParameter("txtpassword");

        String selQryAdmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
        String selQryClinic = "select * from tbl_clinic where clinic_email='" + email + "' and clinic_password='" + password + "'";
        String selQryUser = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
        String selQryShop = "select * from tbl_shop where shop_email='" + email + "' and shop_password='" + password + "'";
        String selQryDelivery = "select * from tbl_deliveryboy where deliveryboy_email='" + email + "' and deliveryboy_password='" + password + "'";

        ResultSet admin = con.selectCommand(selQryAdmin);
        ResultSet clinic = con.selectCommand(selQryClinic);
        ResultSet user = con.selectCommand(selQryUser);
        ResultSet shop = con.selectCommand(selQryShop);
        ResultSet delivery = con.selectCommand(selQryDelivery);

        if (admin.next()) {
            session.setAttribute("aid", admin.getString("admin_id"));
            session.setAttribute("aname", admin.getString("admin_name"));
            response.sendRedirect("../Admin/HomePage.jsp");
        } else if (clinic.next()) {
            int clinicVStatus = clinic.getInt("clinic_vstatus");
//            out.print(clinicVStatus);
            if (clinicVStatus == 1) {
                session.setAttribute("cid", clinic.getString("clinic_id"));
                session.setAttribute("cname", clinic.getString("clinic_name"));
                response.sendRedirect("../Clinic/HomePage.jsp");
            } else if (clinicVStatus ==  2) {
                %>
                <script>
                    alert("Your Verification Has Been Rejected.");
                     window.location="Login.jsp";
                </script>
                <%
                } else {
                %>
                <script>
                    alert("Your Request Is Pending..");
                     window.location="Login.jsp";
                </script>
                <%
                    }

                } else if (shop.next()) {
                    int ShopVStatus = shop.getInt("shop_vstatus");
                    if (ShopVStatus == 1) 
                    {
                        session.setAttribute("sid", shop.getString("shop_id"));
                        session.setAttribute("sname", shop.getString("shop_name"));
                        response.sendRedirect("../MedicalShop/HomePage.jsp");
                    } 
                    else if (ShopVStatus == 2) {
                        %>

                        <script>
                            alert("Your Verification Has Been Rejected.");
                            window.location="Login.jsp";
                        </script>
                        <%
                    }
                    else {
                %>
                <script>
                    alert("Your Request Is Pending..");
                     window.location="Login.jsp";
                </script>
                <%
                  }
        } else if (delivery.next()) {
            session.setAttribute("did", delivery.getString("deliveryboy_id"));
            session.setAttribute("dname", delivery.getString("deliveryboy_name"));
            response.sendRedirect("../DeliveryBoy/HomePage.jsp");
        } else if (user.next()) {
            session.setAttribute("uid", user.getString("user_id"));
            session.setAttribute("uname", user.getString("user_name"));
            response.sendRedirect("../User/HomePage.jsp");

        } else {
            out.print("<script>alert('Iinvalid Credential')</script>");

        }

    }

%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="../Assets/Templates/Login/fonts/icomoon/style.css">

        <link rel="stylesheet" href="../Assets/Templates/Login/css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../Assets/Templates/Login/css/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="../Assets/Templates/Login/css/style.css">

        <title>Login #8</title>
    </head>
    <body>



        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 order-md-2">
                        <img src="../Assets/Templates/Login/images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <h3>Sign In to <strong>MedicArmy</strong></h3>
                                    <!--<p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>-->
                                </div> 
                                <form action="#" method="post">
                                    <div class="form-group first">
                                        <label for="username">Username</label>
                                        <input type="text" name="txtemail" class="form-control" id="username">

                                    </div>
                                    <div class="form-group last mb-4">
                                        <label for="password">Password</label>
                                        <input type="password" name="txtpassword" class="form-control" id="password">

                                    </div>

                                    <div class="d-flex mb-5 align-items-center">
                                        <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                                            <input type="checkbox" checked="checked"/>
                                            <div class="control__indicator"></div>
                                        </label>
                                        <span class="ml-auto"><a href="ForgetPassword.jsp" class="forgot-pass">Forgot Password</a></span> 
                                    </div>

                                    <input type="submit" name="btnlogin" value="Log In" class="btn text-white btn-block btn-primary">

                                    <span class="d-block text-left my-4 text-muted"> or sign in with</span>

                                    <div class="social-login">
                                        <a href="#" class="facebook">
                                            <span class="icon-facebook mr-3"></span> 
                                        </a>
                                        <a href="#" class="twitter">
                                            <span class="icon-twitter mr-3"></span> 
                                        </a>
                                        <a href="#" class="google">
                                            <span class="icon-google mr-3"></span> 
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>


        <script src="../Assets/Templates/Login/js/jquery-3.3.1.min.js"></script>
        <script src="../Assets/Templates/Login/js/popper.min.js"></script>
        <script src="../Assets/Templates/Login/js/bootstrap.min.js"></script>
        <script src="../Assets/Templates/Login/js/main.js"></script>
    </body>
</html>