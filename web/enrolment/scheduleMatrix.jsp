<%-- 
    Document   : scheduleMatrix
    Created on : May 21, 2016, 12:24:38 AM
    Author     : rub account
--%>

<%@page import="SAIS.Schedule"%>
<%@page import="SAIS.SAISConnection"%>
<%@page import="java.awt.Point"%>
<%@page import="java.sql.ResultSet"%>
<div>
    <table border="1">
        <tr>
            <td id="0-0"></td><td id="0-1"></td><td id="0-2"></td><td id="0-3"></td><td id="0-4"></td><td id="0-5"></td><td id="0-6"></td>
        </tr>
        <tr>
            <td id="1-0"></td><td id="1-1"></td><td id="1-2"></td><td id="1-3"></td><td id="1-4"></td><td id="1-5"></td><td id="1-6"></td>
        </tr>
        <tr>
            <td id="2-0"></td><td id="2-1"></td><td id="2-2"></td><td id="2-3"></td><td id="2-4"></td><td id="2-5"></td><td id="2-6"></td>
        </tr>
        <tr>
            <td id="3-0"></td><td id="3-1"></td><td id="3-2"></td><td id="3-3"></td><td id="3-4"></td><td id="3-5"></td><td id="3-6"></td>
        </tr>
        <tr>
            <td id="4-0"></td><td id="4-1"></td><td id="4-2"></td><td id="4-3"></td><td id="4-4"></td><td id="4-5"></td><td id="4-6"></td>
        </tr>
        <tr>
            <td id="5-0"></td><td id="5-1"></td><td id="5-2"></td><td id="5-3"></td><td id="5-4"></td><td id="5-5"></td><td id="5-6"></td>
        </tr>
        <tr>
            <td id="6-0"></td><td id="6-1"></td><td id="6-2"></td><td id="6-3"></td><td id="6-4"></td><td id="6-5"></td><td id="6-6"></td>
        </tr>
        <tr>
            <td id="7-0"></td><td id="7-1"></td><td id="7-2"></td><td id="7-3"></td><td id="7-4"></td><td id="7-5"></td><td id="7-6"></td>
        </tr>
        <tr>
            <td id="8-0"></td><td id="8-1"></td><td id="8-2"></td><td id="8-3"></td><td id="8-4"></td><td id="8-5"></td><td id="8-6"></td>
        </tr>
        <tr>
            <td id="9-0"></td><td id="9-1"></td><td id="9-2"></td><td id="9-3"></td><td id="9-4"></td><td id="9-5"></td><td id="9-6"></td>
        </tr>
        <tr>
            <td id="10-0"></td><td id="10-1"></td><td id="10-2"></td><td id="10-3"></td><td id="10-4"></td><td id="10-5"></td><td id="10-6"></td>
        </tr>
        <tr>
            <td id="11-0"></td><td id="11-1"></td><td id="11-2"></td><td id="11-3"></td><td id="11-4"></td><td id="11-5"></td><td id="11-6"></td>
        </tr>
        <tr>
            <td id="12-0"></td><td id="12-1"></td><td id="12-2"></td><td id="12-3"></td><td id="12-4"></td><td id="12-5"></td><td id="12-6"></td>
        </tr>
        <tr>
            <td id="13-0"></td><td id="13-1"></td><td id="13-2"></td><td id="13-3"></td><td id="13-4"></td><td id="13-5"></td><td id="13-6"></td>
        </tr>
        <tr>
            <td id="14-0"></td><td id="14-1"></td><td id="14-2"></td><td id="14-3"></td><td id="14-4"></td><td id="14-5"></td><td id="14-6"></td>
        </tr>
        <tr>
            <td id="15-0"></td><td id="15-1"></td><td id="15-2"></td><td id="15-3"></td><td id="15-4"></td><td id="15-5"></td><td id="15-6"></td>
        </tr>
        <tr>
            <td id="16-0"></td><td id="16-1"></td><td id="16-2"></td><td id="16-3"></td><td id="16-4"></td><td id="16-5"></td><td id="16-6"></td>
        </tr>
        <tr>
            <td id="17-0"></td><td id="17-1"></td><td id="17-2"></td><td id="17-3"></td><td id="17-4"></td><td id="17-5"></td><td id="17-6"></td>
        </tr>
        <tr>
            <td id="18-0"></td><td id="18-1"></td><td id="18-2"></td><td id="18-3"></td><td id="18-4"></td><td id="18-5"></td><td id="18-6"></td>
        </tr>
        <tr>
            <td id="19-0"></td><td id="19-1"></td><td id="19-2"></td><td id="19-3"></td><td id="19-4"></td><td id="19-5"></td><td id="19-6"></td>
        </tr>
        <tr>
            <td id="20-0"></td><td id="20-1"></td><td id="20-2"></td><td id="20-3"></td><td id="20-4"></td><td id="20-5"></td><td id="20-6"></td>
        </tr>
        <tr>
            <td id="21-0"></td><td id="21-1"></td><td id="21-2"></td><td id="21-3"></td><td id="21-4"></td><td id="21-5"></td><td id="21-6"></td>
        </tr>
        <tr>
            <td id="22-0"></td><td id="22-1"></td><td id="22-2"></td><td id="22-3"></td><td id="22-4"></td><td id="22-5"></td><td id="22-6"></td>
        </tr>
        <tr>
            <td id="23-0"></td><td id="23-1"></td><td id="23-2"></td><td id="23-3"></td><td id="23-4"></td><td id="23-5"></td><td id="23-6"></td>
        </tr>
        <tr>
            <td id="24-0"></td><td id="24-1"></td><td id="24-2"></td><td id="24-3"></td><td id="24-4"></td><td id="24-5"></td><td id="24-6"></td>
        </tr>
        <tr>
            <td id="25-0"></td><td id="25-1"></td><td id="25-2"></td><td id="25-3"></td><td id="25-4"></td><td id="25-5"></td><td id="25-6"></td>
        </tr>
    </table>
</div>
<div id="enlisted-courses"><%--added schedules--%>
    <%
    SAISConnection con = new SAISConnection();
    Schedule sched = new Schedule();
    con.connect();
    String student_id="1";
    int course_enrolment_id;
    String day;
    String schedule;
    String start;
    String end;
    String professor;
    String room;
    int course_id;
    ResultSet courseEnlistmentRS=con.executeQuery("select * from course,day,schedule,course_enrolment,room,professor where day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id and course_enrolment.id in (select course_enrolment_id from enlistment where student_id="+student_id+")");
    while(courseEnlistmentRS.next()){
        day=courseEnlistmentRS.getString("course_enrolment.week_stamp");
        start=courseEnlistmentRS.getString("schedule.start");
        end=courseEnlistmentRS.getString("schedule.end");
    %>
        <%
            for(Point p:sched.scheduleSlot(start, end, day)){
        %>
        <script>
            fillSchedule(<%=p.y%>,<%=p.x%>)
        </script>
        <%
            }
        %>
    <%}%>
</div>