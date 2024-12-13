package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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
                
      out.write("\n");
      out.write("                <script>\n");
      out.write("                    alert(\"Your Verification Has Been Rejected.\");\n");
      out.write("                     window.location=\"Login.jsp\";\n");
      out.write("                </script>\n");
      out.write("                ");

                } else {
                
      out.write("\n");
      out.write("                <script>\n");
      out.write("                    alert(\"Your Request Is Pending..\");\n");
      out.write("                     window.location=\"Login.jsp\";\n");
      out.write("                </script>\n");
      out.write("                ");

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
                        
      out.write("\n");
      out.write("\n");
      out.write("                        <script>\n");
      out.write("                            alert(\"Your Verification Has Been Rejected.\");\n");
      out.write("                            window.location=\"Login.jsp\";\n");
      out.write("                        </script>\n");
      out.write("                        ");

                    }
                    else {
                
      out.write("\n");
      out.write("                <script>\n");
      out.write("                    alert(\"Your Request Is Pending..\");\n");
      out.write("                     window.location=\"Login.jsp\";\n");
      out.write("                </script>\n");
      out.write("                ");

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


      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <!-- Required meta tags -->\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Templates/Login/fonts/icomoon/style.css\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Templates/Login/css/owl.carousel.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Templates/Login/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Style -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Templates/Login/css/style.css\">\n");
      out.write("\n");
      out.write("        <title>Login #8</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-6 order-md-2\">\n");
      out.write("                        <img src=\"../Assets/Templates/Login/images/undraw_file_sync_ot38.svg\" alt=\"Image\" class=\"img-fluid\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6 contents\">\n");
      out.write("                        <div class=\"row justify-content-center\">\n");
      out.write("                            <div class=\"col-md-8\">\n");
      out.write("                                <div class=\"mb-4\">\n");
      out.write("                                    <h3>Sign In to <strong>MedicArmy</strong></h3>\n");
      out.write("                                    <!--<p class=\"mb-4\">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>-->\n");
      out.write("                                </div> \n");
      out.write("                                <form action=\"#\" method=\"post\">\n");
      out.write("                                    <div class=\"form-group first\">\n");
      out.write("                                        <label for=\"username\">Username</label>\n");
      out.write("                                        <input type=\"text\" name=\"txtemail\" class=\"form-control\" id=\"username\">\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group last mb-4\">\n");
      out.write("                                        <label for=\"password\">Password</label>\n");
      out.write("                                        <input type=\"password\" name=\"txtpassword\" class=\"form-control\" id=\"password\">\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"d-flex mb-5 align-items-center\">\n");
      out.write("                                        <label class=\"control control--checkbox mb-0\"><span class=\"caption\">Remember me</span>\n");
      out.write("                                            <input type=\"checkbox\" checked=\"checked\"/>\n");
      out.write("                                            <div class=\"control__indicator\"></div>\n");
      out.write("                                        </label>\n");
      out.write("                                        <span class=\"ml-auto\"><a href=\"ForgetPassword.jsp\" class=\"forgot-pass\">Forgot Password</a></span> \n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <input type=\"submit\" name=\"btnlogin\" value=\"Log In\" class=\"btn text-white btn-block btn-primary\">\n");
      out.write("\n");
      out.write("                                    <span class=\"d-block text-left my-4 text-muted\"> or sign in with</span>\n");
      out.write("\n");
      out.write("                                    <div class=\"social-login\">\n");
      out.write("                                        <a href=\"#\" class=\"facebook\">\n");
      out.write("                                            <span class=\"icon-facebook mr-3\"></span> \n");
      out.write("                                        </a>\n");
      out.write("                                        <a href=\"#\" class=\"twitter\">\n");
      out.write("                                            <span class=\"icon-twitter mr-3\"></span> \n");
      out.write("                                        </a>\n");
      out.write("                                        <a href=\"#\" class=\"google\">\n");
      out.write("                                            <span class=\"icon-google mr-3\"></span> \n");
      out.write("                                        </a>\n");
      out.write("                                    </div>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"../Assets/Templates/Login/js/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <script src=\"../Assets/Templates/Login/js/popper.min.js\"></script>\n");
      out.write("        <script src=\"../Assets/Templates/Login/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"../Assets/Templates/Login/js/main.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
