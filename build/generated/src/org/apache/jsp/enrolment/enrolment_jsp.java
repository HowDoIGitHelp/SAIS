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
      out.write("        \n");
      out.write("        <div id=\"enlisted-courses\">");
      out.write("\n");
      out.write("            ");

            String student_id="1";
            int course_enrolment_id;
            String day;
            String schedule;
            String professor;
            String room;
            int course_id;
            ResultSet courseEnlistmentRS=con.executeQuery("select * from course,day,schedule,course_enrolment,room,professor where day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id and course_enrolment.id in (select course_enrolment_id from enlistment where student_id="+student_id+")");
            while(courseEnlistmentRS.next()){
                course_enrolment_id=courseEnlistmentRS.getInt("course_enrolment.id");
                code=courseEnlistmentRS.getString("course.code");
                day=courseEnlistmentRS.getString("day.name");
                schedule=courseEnlistmentRS.getString("schedule.start")+" "+courseEnlistmentRS.getString("schedule.end");
                professor=courseEnlistmentRS.getString("professor.name");
                room=courseEnlistmentRS.getString("room.name");
                course_id=courseEnlistmentRS.getInt("course.id");
            
      out.write("\n");
      out.write("            <div>");
      out.write("\n");
      out.write("                ");
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
      out.write("                <a onclick=\"unlist(");
      out.print(course_enrolment_id);
      out.write(',');
      out.print(course_id);
      out.write(")\">remove from cart</a>\\\n");
      out.write("                <script>\n");
      out.write("                    \n");
      out.write("                </script>\n");
      out.write("            </div>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"0-0\"></td><td id=\"0-1\"></td><td id=\"0-2\"></td><td id=\"0-3\"></td><td id=\"0-4\"></td><td id=\"0-5\"></td><td id=\"0-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"1-0\"></td><td id=\"1-1\"></td><td id=\"1-2\"></td><td id=\"1-3\"></td><td id=\"1-4\"></td><td id=\"1-5\"></td><td id=\"1-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"2-0\"></td><td id=\"2-1\"></td><td id=\"2-2\"></td><td id=\"2-3\"></td><td id=\"2-4\"></td><td id=\"2-5\"></td><td id=\"2-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"3-0\"></td><td id=\"3-1\"></td><td id=\"3-2\"></td><td id=\"3-3\"></td><td id=\"3-4\"></td><td id=\"3-5\"></td><td id=\"3-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"4-0\"></td><td id=\"4-1\"></td><td id=\"4-2\"></td><td id=\"4-3\"></td><td id=\"4-4\"></td><td id=\"4-5\"></td><td id=\"4-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"5-0\"></td><td id=\"5-1\"></td><td id=\"5-2\"></td><td id=\"5-3\"></td><td id=\"5-4\"></td><td id=\"5-5\"></td><td id=\"5-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"6-0\"></td><td id=\"6-1\"></td><td id=\"6-2\"></td><td id=\"6-3\"></td><td id=\"6-4\"></td><td id=\"6-5\"></td><td id=\"6-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"7-0\"></td><td id=\"7-1\"></td><td id=\"7-2\"></td><td id=\"7-3\"></td><td id=\"7-4\"></td><td id=\"7-5\"></td><td id=\"7-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"8-0\"></td><td id=\"8-1\"></td><td id=\"8-2\"></td><td id=\"8-3\"></td><td id=\"8-4\"></td><td id=\"8-5\"></td><td id=\"8-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"9-0\"></td><td id=\"9-1\"></td><td id=\"9-2\"></td><td id=\"9-3\"></td><td id=\"9-4\"></td><td id=\"9-5\"></td><td id=\"9-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"10-0\"></td><td id=\"10-1\"></td><td id=\"10-2\"></td><td id=\"10-3\"></td><td id=\"10-4\"></td><td id=\"10-5\"></td><td id=\"10-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"11-0\"></td><td id=\"11-1\"></td><td id=\"11-2\"></td><td id=\"11-3\"></td><td id=\"11-4\"></td><td id=\"11-5\"></td><td id=\"11-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"12-0\"></td><td id=\"12-1\"></td><td id=\"12-2\"></td><td id=\"12-3\"></td><td id=\"12-4\"></td><td id=\"12-5\"></td><td id=\"12-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"13-0\"></td><td id=\"13-1\"></td><td id=\"13-2\"></td><td id=\"13-3\"></td><td id=\"13-4\"></td><td id=\"13-5\"></td><td id=\"13-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"14-0\"></td><td id=\"14-1\"></td><td id=\"14-2\"></td><td id=\"14-3\"></td><td id=\"14-4\"></td><td id=\"14-5\"></td><td id=\"14-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"15-0\"></td><td id=\"15-1\"></td><td id=\"15-2\"></td><td id=\"15-3\"></td><td id=\"15-4\"></td><td id=\"15-5\"></td><td id=\"15-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"16-0\"></td><td id=\"16-1\"></td><td id=\"16-2\"></td><td id=\"16-3\"></td><td id=\"16-4\"></td><td id=\"16-5\"></td><td id=\"16-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"17-0\"></td><td id=\"17-1\"></td><td id=\"17-2\"></td><td id=\"17-3\"></td><td id=\"17-4\"></td><td id=\"17-5\"></td><td id=\"17-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"18-0\"></td><td id=\"18-1\"></td><td id=\"18-2\"></td><td id=\"18-3\"></td><td id=\"18-4\"></td><td id=\"18-5\"></td><td id=\"18-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"19-0\"></td><td id=\"19-1\"></td><td id=\"19-2\"></td><td id=\"19-3\"></td><td id=\"19-4\"></td><td id=\"19-5\"></td><td id=\"19-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"20-0\"></td><td id=\"20-1\"></td><td id=\"20-2\"></td><td id=\"20-3\"></td><td id=\"20-4\"></td><td id=\"20-5\"></td><td id=\"20-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"21-0\"></td><td id=\"21-1\"></td><td id=\"21-2\"></td><td id=\"21-3\"></td><td id=\"21-4\"></td><td id=\"21-5\"></td><td id=\"21-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"22-0\"></td><td id=\"22-1\"></td><td id=\"22-2\"></td><td id=\"22-3\"></td><td id=\"22-4\"></td><td id=\"22-5\"></td><td id=\"22-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"23-0\"></td><td id=\"23-1\"></td><td id=\"23-2\"></td><td id=\"23-3\"></td><td id=\"23-4\"></td><td id=\"23-5\"></td><td id=\"23-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"24-0\"></td><td id=\"24-1\"></td><td id=\"24-2\"></td><td id=\"24-3\"></td><td id=\"24-4\"></td><td id=\"24-5\"></td><td id=\"24-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"25-0\"></td><td id=\"25-1\"></td><td id=\"25-2\"></td><td id=\"25-3\"></td><td id=\"25-4\"></td><td id=\"25-5\"></td><td id=\"25-6\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
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
