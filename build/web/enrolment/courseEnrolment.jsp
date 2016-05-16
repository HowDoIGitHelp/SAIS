<%@page import="java.sql.ResultSet"%>
<%@page import="SAIS.SAISConnection"%>
<%
    SAISConnection con = new SAISConnection();
    con.connect();
%>
    
            <%
                String id=request.getParameter("id");
                String code;
                String day;
                String schedule;
                String professor;
                String room;
                ResultSet courseRS=con.executeQuery("select * from course,day,schedule,course_enrolment,room,professor where course.id="+id+" and day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id;");
                while(courseRS.next()){
                    code=courseRS.getString("course.code");
                    day=courseRS.getString("day.name");
                    schedule=courseRS.getString("schedule.start")+" "+courseRS.getString("schedule.end");
                    professor=courseRS.getString("professor.name");
                    room=courseRS.getString("room.name");
            %>
            <div><%--one course--%>
                <%=code%> <%=day%> <%=schedule%> <%=professor%> <%=room%> 
            </div>
            <%
                }
            %>