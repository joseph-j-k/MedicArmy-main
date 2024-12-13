package org.apache.jsp.Clinic;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Availability_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Clinic/Head.jsp");
    _jspx_dependants.add("/Clinic/Foot.jsp");
  }

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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <!-- Basic -->\n");
      out.write("  <meta charset=\"utf-8\" />\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("  <!-- Mobile Metas -->\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\" />\n");
      out.write("  <!-- Site Metas -->\n");
      out.write("  <meta name=\"keywords\" content=\"\" />\n");
      out.write("  <meta name=\"description\" content=\"\" />\n");
      out.write("  <meta name=\"author\" content=\"\" />\n");
      out.write("  <link rel=\"shortcut icon\" href=\"../Assets/Templates/Main/images/favicon.png\" type=\"\">\n");
      out.write("\n");
      out.write("  <title>  MEDICARMY </title>\n");
      out.write("\n");
      out.write("  <!-- bootstrap core css -->\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"../Assets/Templates/Main/css/bootstrap.css\" />\n");
      out.write("\n");
      out.write("  <!-- fonts style -->\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!--owl slider stylesheet -->\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css\" />\n");
      out.write("\n");
      out.write("  <!-- font awesome style -->\n");
      out.write("  <link href=\"../Assets/Templates/Main/css/font-awesome.min.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("  <!-- Custom styles for this template -->\n");
      out.write("  <link href=\"../Assets/Templates/Main/css/style.css\" rel=\"stylesheet\" />\n");
      out.write("  <!-- responsive style -->\n");
      out.write("  <link href=\"../Assets/Templates/Main/css/responsive.css\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("  <div class=\"hero_area\">\n");
      out.write("\n");
      out.write("    <div class=\"hero_bg_box\">\n");
      out.write("      <img src=\"../Assets/Templates/Main/images/hero-bg.png\" alt=\"\">\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- header section strats -->\n");
      out.write("    <header class=\"header_section\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <nav class=\"navbar navbar-expand-lg custom_nav-container \">\n");
      out.write("          <a class=\"navbar-brand\" href=\"index.html\">\n");
      out.write("            <span>\n");
      out.write("               MEDICARMY\n");
      out.write("            </span>\n");
      out.write("          </a>\n");
      out.write("\n");
      out.write("          <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("            <span class=\"\"> </span>\n");
      out.write("          </button>\n");
      out.write("\n");
      out.write("          <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("            <ul class=\"navbar-nav\">\n");
      out.write("             <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"HomePage.jsp\">Home <span class=\"sr-only\">(current)</span></a>\n");
      out.write("              </li>\n");
      out.write("              <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"ClinicMyProfile.jsp\"> My Profile</a>\n");
      out.write("              </li>\n");
      out.write("             \n");
      out.write("              <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"Availability.jsp\">Availibility</a>\n");
      out.write("              </li>\n");
      out.write("              <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"ViewClinicAppointments.jsp\">View Appointments</a>\n");
      out.write("              </li>\n");
      out.write("              \n");
      out.write("              <li class=\"nav-item\">\n");
      out.write("                  <a class=\"nav-link\" href=\"../Logout.jsp\">LogOut</a>\n");
      out.write("              </li>\n");
      out.write("              <form class=\"form-inline\">\n");
      out.write("                <button class=\"btn  my-2 my-sm-0 nav_search-btn\" type=\"submit\">\n");
      out.write("                  <i class=\"fa fa-search\" aria-hidden=\"true\"></i>\n");
      out.write("                </button>\n");
      out.write("              </form>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </nav>\n");
      out.write("      </div>\n");
      out.write("    </header>\n");
      out.write("    <!-- end header section -->\n");
      out.write("     <section class=\"slider_section \">\n");
      out.write("         <div class=\"container \">");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Availabily</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"card\">\n");
      out.write("\n");
      out.write("                ");

                    if (request.getParameter("btnsubmit") != null) {
                        String stime = request.getParameter("stime");
                        String etime = request.getParameter("etime");
                        String slot = request.getParameter("slot");
                        String insQry = "insert into tbl_availability(availability_stime,availability_etime,availability_slot,clinic_id) values('" + stime + "','" + etime + "','" + slot + "','" + session.getAttribute("cid") + "')";
                        out.println(insQry);
                        if (con.executeCommand(insQry)) {
                
      out.write("\n");
      out.write("                <script>\n");
      out.write("                    alert(\"Record Saved\");\n");
      out.write("                    window.location = \"Availability.jsp\";\n");
      out.write("                </script>\n");
      out.write("                ");

                        }
                    }
                
      out.write("\n");
      out.write("\n");
      out.write("                ");

                    if (request.getParameter("did") != null) {
                        String delQry = "delete from tbl_availability where availability_id=" + request.getParameter("did");
                        if (con.executeCommand(delQry)) {
                
      out.write("\n");
      out.write("                <script>\n");
      out.write("                    alert(\"Deleted\");\n");
      out.write("                    window.location = \"Availability.jsp\";\n");
      out.write("                </script>\n");
      out.write("                ");

                        }
                    }
                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <h1 align=\"center\" class=\"card-title\">Availabilty</h1>\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <form method=\"post\">\n");
      out.write("\n");
      out.write("                        <table align=\"center\" class=\"table table-responsive table-bordered\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Start time</td>\n");
      out.write("                                <td><input type=\"time\" name=\"stime\" id=\"stime\" placeholder=\"Enter start time\" required=\"required\"><br></td>\n");
      out.write("                            </tr>\n");
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>End time</td>\n");
      out.write("                                <td><input type=\"time\"  name=\"etime\" id=\"etime\" placeholder=\"Enter end time\" required=\"required\"></textarea><br></td>\n");
      out.write("                            </tr>\n");
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Slot</td>\n");
      out.write("                                <td><input type=\"number\" name=\"slot\" id=\"slot\" placeholder=\"Enter slot\" required=\"required\"><br></td>\n");
      out.write("                            </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\" align=\"center\"><input type=\"submit\"  id=\"btnsubmit\" name=\"btnsubmit\" value=\"Submit\"></td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\" align=\"center\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>Sl.No</th>\n");
      out.write("            <th>Start Time</th>\n");
      out.write("            <th>End Time</th>\n");
      out.write("            <th>Slot</th>\n");
      out.write("            <th>Action</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("\n");
      out.write("        ");

            String selQry1 = "select * from tbl_availability where clinic_id=" + session.getAttribute("cid");
            ResultSet rs1 = con.selectCommand(selQry1);
            int i = 0;
            while (rs1.next()) {
                i++;
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs1.getString("availability_stime"));
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs1.getString("availability_etime"));
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs1.getString("availability_slot"));
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <td><a href=\"Availability.jsp?did=");
      out.print( rs1.getString("availability_id"));
      out.write("\">Delete</a></td>\n");
      out.write("        </tr>\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("  <!-- footer section -->\n");
      out.write("  <footer class=\"footer_section\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-6 col-lg-3 footer_col\">\n");
      out.write("          <div class=\"footer_contact\">\n");
      out.write("            <h4>\n");
      out.write("              Reach at..\n");
      out.write("            </h4>\n");
      out.write("            <div class=\"contact_link_box\">\n");
      out.write("              <a href=\"\">\n");
      out.write("                <i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>\n");
      out.write("                <span>\n");
      out.write("                  Location\n");
      out.write("                </span>\n");
      out.write("              </a>\n");
      out.write("              <a href=\"\">\n");
      out.write("                <i class=\"fa fa-phone\" aria-hidden=\"true\"></i>\n");
      out.write("                <span>\n");
      out.write("                  Call +01 1234567890\n");
      out.write("                </span>\n");
      out.write("              </a>\n");
      out.write("              <a href=\"\">\n");
      out.write("                <i class=\"fa fa-envelope\" aria-hidden=\"true\"></i>\n");
      out.write("                <span>\n");
      out.write("                  demo@gmail.com\n");
      out.write("                </span>\n");
      out.write("              </a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"footer_social\">\n");
      out.write("            <a href=\"\">\n");
      out.write("              <i class=\"fa fa-facebook\" aria-hidden=\"true\"></i>\n");
      out.write("            </a>\n");
      out.write("            <a href=\"\">\n");
      out.write("              <i class=\"fa fa-twitter\" aria-hidden=\"true\"></i>\n");
      out.write("            </a>\n");
      out.write("            <a href=\"\">\n");
      out.write("              <i class=\"fa fa-linkedin\" aria-hidden=\"true\"></i>\n");
      out.write("            </a>\n");
      out.write("            <a href=\"\">\n");
      out.write("              <i class=\"fa fa-instagram\" aria-hidden=\"true\"></i>\n");
      out.write("            </a>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-6 col-lg-3 footer_col\">\n");
      out.write("          <div class=\"footer_detail\">\n");
      out.write("            <h4>\n");
      out.write("              About\n");
      out.write("            </h4>\n");
      out.write("            <p>\n");
      out.write("              Beatae provident nobis mollitia magnam voluptatum, unde dicta facilis minima veniam corporis laudantium alias tenetur eveniet illum reprehenderit fugit a delectus officiis blanditiis ea.\n");
      out.write("            </p>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-6 col-lg-2 mx-auto footer_col\">\n");
      out.write("          <div class=\"footer_link_box\">\n");
      out.write("            <h4>\n");
      out.write("              Links\n");
      out.write("            </h4>\n");
      out.write("            <div class=\"footer_links\">\n");
      out.write("              <a class=\"active\" href=\"index.html\">\n");
      out.write("                Home\n");
      out.write("              </a>\n");
      out.write("              <a class=\"\" href=\"about.html\">\n");
      out.write("                About\n");
      out.write("              </a>\n");
      out.write("              <a class=\"\" href=\"departments.html\">\n");
      out.write("                Departments\n");
      out.write("              </a>\n");
      out.write("              <a class=\"\" href=\"doctors.html\">\n");
      out.write("                Doctors\n");
      out.write("              </a>\n");
      out.write("              <a class=\"\" href=\"contact.html\">\n");
      out.write("                Contact Us\n");
      out.write("              </a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-6 col-lg-3 footer_col \">\n");
      out.write("          <h4>\n");
      out.write("            Newsletter\n");
      out.write("          </h4>\n");
      out.write("          <form action=\"#\">\n");
      out.write("            <input type=\"email\" placeholder=\"Enter email\" />\n");
      out.write("            <button type=\"submit\">\n");
      out.write("              Subscribe\n");
      out.write("            </button>\n");
      out.write("          </form>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"footer-info\">\n");
      out.write("        <p>\n");
      out.write("          &copy; <span id=\"displayYear\"></span> All Rights Reserved By\n");
      out.write("          <a href=\"https://html.design/\">Free Html Templates<br><br></a>\n");
      out.write("            &copy; <span id=\"displayYear\"></span> Distributed By\n");
      out.write("            <a href=\"https://themewagon.com/\">ThemeWagon</a>\n");
      out.write("        </p>\n");
      out.write("       \n");
      out.write("      </div>  \n");
      out.write("    </div>\n");
      out.write("  </footer>\n");
      out.write("  <!-- footer section -->\n");
      out.write("\n");
      out.write("  <!-- jQery -->\n");
      out.write("  <script type=\"text/javascript\" src=\"../Assets/Templates/Main/js/jquery-3.4.1.min.js\"></script>\n");
      out.write("  <!-- popper js -->\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\">\n");
      out.write("  </script>\n");
      out.write("  <!-- bootstrap js -->\n");
      out.write("  <script type=\"text/javascript\" src=\"../Assets/Templates/Main/js/bootstrap.js\"></script>\n");
      out.write("  <!-- owl slider -->\n");
      out.write("  <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js\">\n");
      out.write("  </script>\n");
      out.write("  <!-- custom js -->\n");
      out.write("  <script type=\"text/javascript\" src=\"../Assets/Templates/Main/js/custom.js\"></script>\n");
      out.write("  <!-- Google Map -->\n");
      out.write("  <script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap\">\n");
      out.write("  </script>\n");
      out.write("  <!-- End Google Map -->\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write('\n');
      out.write('\n');
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
