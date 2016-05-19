package org.apache.jsp.enrolment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import SAIS.SAISConnection;

public final class enlistedCourses_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    SAISConnection con = new SAISConnection();
    con.connect();

      out.write('\n');
      out.write('\n');

    String student_id="1";
    int course_enrolment_id;
    String day;
    String code;
    String schedule;
    String professor;
    String room;
    ResultSet courseEnlistmentRS=con.executeQuery("select * from course,day,schedule,course_enrolment,room,professor where day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id and course_enrolment.id in (select course_enrolment_id from enlistment where student_id="+student_id+")");
    while(courseEnlistmentRS.next()){
        course_enrolment_id=courseEnlistmentRS.getInt("course_enrolment.id");
        code=courseEnlistmentRS.getString("course.code");
        day=courseEnlistmentRS.getString("day.name");
        schedule=courseEnlistmentRS.getString("schedule.start")+" "+courseEnlistmentRS.getString("schedule.end");
        professor=courseEnlistmentRS.getString("professor.name");
        room=courseEnlistmentRS.getString("room.name");

      out.write("\n");
      out.write("Added Courses\n");
      out.write("<div>");
      out.write("\n");
      out.write("    ");
      out.print(code);
      out.write(' ');
      out.print(day);
      out.write(' ');
      out.print(schedule);
      out.write(' ');
      out.print(professor);
      out.write(' ');
      out.print(room);
      out.write(" \n");
      out.write("    <a onclick=\"unlist(");
      out.print(course_enrolment_id);
      out.write(")\">remove from cart</a>\n");
      out.write("</div>\n");
}
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
