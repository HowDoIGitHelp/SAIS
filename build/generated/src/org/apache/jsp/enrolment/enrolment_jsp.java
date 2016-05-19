package org.apache.jsp.enrolment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import SAIS.SAISConnection;

public final class enrolment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("html;charset=UTF-8");
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

    SAISConnection con = new SAISConnection();
    con.connect();

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script src=\"../scripts/jquery-1.11.3.js\"/></script>\n");
      out.write("        <script src=\"../scripts/generalScripts.js\"/></script>\n");
      out.write("        <script src=\"../scripts/enrolment.js\"/></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div> ");
      out.write("\n");
      out.write("            ");

                int id;
                String code;
                String name;
                String field;
                String description;
                ResultSet courseRS=con.executeQuery("select * from course");
                while(courseRS.next()){
                    id=courseRS.getInt("id");
                    code=courseRS.getString("code");
                    name=courseRS.getString("name");
                    description=courseRS.getString("description");
            
      out.write("\n");
      out.write("            <div style=\"border-style: solid\">");
      out.write("\n");
      out.write("                <b>");
      out.print(code);
      out.write(' ');
      out.print(name);
      out.write(' ');
      out.print(description);
      out.write(" <div id=\"show-button");
      out.print(id);
      out.write("\" onclick=\"loadEnrolment(");
      out.print(id);
      out.write(")\">show</div></b>\n");
      out.write("                <div id=\"course-enrolment");
      out.print(id);
      out.write("\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
