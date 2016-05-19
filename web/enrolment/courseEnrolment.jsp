<%@page import="java.sql.ResultSet"%>
<%@page import="SAIS.SAISConnection"%>
<%
    SAISConnection con = new SAISConnection();
    con.connect();
%>
    
            <%
                String student_id="1";
                String course_id=request.getParameter("id");
                int id;
                String code;
                String day;
                String schedule;
                String professor;
                String room;
                int enlisted;
                ResultSet courseRS=con.executeQuery("select * from (course,day,schedule,course_enrolment,room,professor) left join enlistment on course_enrolment.id=enlistment.course_enrolment_id where (enlistment.student_id="+student_id+" or enlistment.student_id is null) and day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id and course_enrolment.id and course.id="+course_id+" order by course_enrolment.id;");
                while(courseRS.next()){
                    id=courseRS.getInt("course_enrolment.id");
                    code=courseRS.getString("course.code");
                    day=courseRS.getString("day.name");
                    schedule=courseRS.getString("schedule.start")+" "+courseRS.getString("schedule.end");
                    professor=courseRS.getString("professor.name");
                    room=courseRS.getString("room.name");
                    enlisted=courseRS.getInt("enlistment.course_enrolment_id");
            %>
            
            <div><%--one course--%>
                <%=code%> <%=day%> <%=schedule%> <%=professor%> <%=room%> 
            <%
                    if(enlisted==0){
            %>
                <a id="add-button<%=id%>" onclick="enlist(<%=id%>)">add to cart</a>
            <%
                    }
            %>
            <%
                    if(enlisted>0){
            %>
                <a id="add-button<%=id%>">added</a>
            <%
                    }
            %>
            </div>
            <%
                }
            %>