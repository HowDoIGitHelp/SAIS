package org.apache.jsp.enrolment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import SAIS.SAISConnection;

public final class courseEnrolment_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');

    SAISConnection con = new SAISConnection();
    con.connect();

      out.write("\n");
      out.write("<div>\n");
      out.write("            ");

                String code;
                String day;
                String schedule;
                
                ResultSet courseRS=con.executeQuery("select * from course,day,schedule,course_enrolment where course.id=1 and day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id;");
                while(courseRS.next()){
                    code=courseRS.getString("course.code");
                    day=courseRS.getString("day.name");
                    schedule=courseRS.getString("schedule.start")+" "+courseRS.getString("schedule.end");
            
      out.write("\n");
      out.write("            <div>");
      out.write("\n");
      out.write("                ");
      out.print(code);
      out.write(' ');
      out.print(day);
      out.write(' ');
      out.print(schedule);
      out.write("\n");
      out.write("            </div>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("</div>");
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
