package org.apache.jsp.EmailView;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ChangeEmailView_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<div style=\"background-color: #e7fffc; padding: 4px;\">\n");
      out.write("    <div style=\"max-width:600px; margin: 8px auto;\">\n");
      out.write("        <div style=\"background-color: white; border-radius: 8px; padding: 8px;\">\n");
      out.write("            <div align=\"center\"><img src=\"http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png\" alt=\"Cart-Commerce\"\n");
      out.write("                                     style=\"height: 128px; width: 128px;\"></div>\n");
      out.write("            <h1 align=\"center\"><b>Cart-Commerce</b></h1>\n");
      out.write("            <hr>\n");
      out.write("            <h2 align=\"center\" style=\"padding-left: 96px; padding-right: 96px;\">\n");
      out.write("                <b style=\"color: green\">Welcome!</b><br> Please confirm your email for us.\n");
      out.write("            </h2>\n");
      out.write("            <br>\n");
      out.write("            <div id=\"content\" style=\"padding-left: 24px; padding-right: 24px;\">\n");
      out.write("                <p>Hello there,</p>\n");
      out.write("                <p>We recently received a request to change the email address for the Cart-Commerce user UserName to example@email.com</p>\n");
      out.write("                <p>If this is correct, please click on the following link to change it:</p>\n");
      out.write("                <div align=\"center\" style=\"margin: 32px;\">\n");
      out.write("                    <a href=\"http://localhost:8080/Web-Ecommerce/AccountVerify?a=28462b3a477aff1d0b944ffbd22&b=1\" target=\"_blank\" style=\"padding: 16px; background-color: limegreen; border-radius: 8px; text-decoration: none; color: white;\">\n");
      out.write("                        <b>Verify Address</b>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <p>This email has been sent to example@email.com</p>\n");
      out.write("                <br>\n");
      out.write("                <p>Regards,</p>\n");
      out.write("                <p>Cart-Commerce support team</p>\n");
      out.write("                <hr>\n");
      out.write("                <p align=\"center\"><small>You received this email because you requested to register to Cart-Commerce.<br>\n");
      out.write("                        If you didn't request to register, you can safely ignore this e-mail.</small></p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
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
