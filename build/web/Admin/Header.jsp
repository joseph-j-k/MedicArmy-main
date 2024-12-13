<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Mazer Admin Dashboard</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../Assets/Templates/Admin/assets/css/bootstrap.css">

        <link rel="stylesheet" href="../Assets/Templates/Admin/assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="../Assets/Templates/Admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../Assets/Templates/Admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="../Assets/Templates/Admin/assets/css/app.css">
        <link rel="shortcut icon" href="../Assets/Templates/Admin/assets/images/favicon.svg" type="image/x-icon">
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header">
                        <div class="d-flex justify-content-between">
                            <div class="logo">
                                <a href="index.html"><img src="../Assets/Templates/Admin/assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                            </div>
                            <div class="toggler">
                                <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-title">Menu</li>

                            <li class="sidebar-item active ">
                                <a href="HomePage.jsp" class='sidebar-link'>
                                    <i class="bi bi-grid-fill"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a href="index.html" class='sidebar-link'>
                                    <i class="bi bi-grid-fill"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>

                            <li class="sidebar-item  has-sub">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Location</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
                                        <a href="District.jsp">District</a>
                                        <a href="District.jsp">Place</a>
                                    </li>

                                </ul>
                            </li>
                            
                             <li class="sidebar-item  has-sub">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Category</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
                                        <a href="Category.jsp">Category</a>
                                        <a href="SubCategory.jsp">SubCategory</a>
                                    </li>

                                </ul>
                            </li>

                            <li class="sidebar-item  has-sub">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Verifications</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
                                        <a href="ViewClinicRegistration.jsp">Clinic</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="ViewShopRegistration.jsp">MedicalShop</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="ViewUserRegistration.jsp"> Users</a>
                            </li>

                        </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>Complaints</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="ViewComplaint.jsp">New Complaints</a>
                                    <a href="SolvedComplaint.jsp">Solved Complaints</a>
                                </li>

                            </ul>
                        </li>
                        
                        <li class="submenu-item ">
                            <a href="../Logout.jsp"> Logout</a>
                            </li>



                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <div class="page-content">