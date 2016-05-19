<%-- 
    Document   : enrolment
    Created on : May 16, 2016, 11:43:52 PM
    Author     : rub account
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="SAIS.SAISConnection"%>
<%
    SAISConnection con = new SAISConnection();
    con.connect();
%>
<%@page contentType="html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../scripts/jquery-1.11.3.js"/></script>
        <script src="../scripts/generalScripts.js"/></script>
        <script src="../scripts/enrolment.js"/></script>
    </head>
    <body>
        <div> <%--container for all available courses--%>
            <%
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
            %>
            <div style="border-style: solid"><%--one course--%>
                <b><%=code%> <%=name%> <%=description%> <div id="show-button<%=id%>" onclick="loadEnrolment(<%=id%>)">show</div></b>
                <div id="course-enrolment<%=id%>">
                </div>
            </div>
            <%
                }
            %>
        </div>
        
        <div id="enlisted-courses"><%--added schedules--%>
            <%
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
            %>
            <div><%--one course--%>
                <%=code%> <%=day%> <%=schedule%> <%=professor%> <%=room%> 
                <a onclick="unlist(<%=course_enrolment_id%>,<%=course_id%>)">remove from cart</a>
            </div>
            <%}%>
        </div>
    </body>
</html>
