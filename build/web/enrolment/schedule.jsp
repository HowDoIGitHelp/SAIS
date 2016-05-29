<%@page import="SAIS.Schedule"%>
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
    String start;
    String end;
    String completeSchedule;
    String block;
    int enlisted;
    ResultSet courseRS=con.executeQuery("select * from (course,day,schedule,course_enrolment,room,professor) left join enlistment on course_enrolment.id=enlistment.course_enrolment_id where (enlistment.student_id="+student_id+" or enlistment.student_id is null) and day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id and course_enrolment.id and course.id="+course_id+" order by course_enrolment.id;");
    while(courseRS.next()){
        id=courseRS.getInt("course_enrolment.id");
        code=courseRS.getString("course.code");
        day=courseRS.getString("course_enrolment.week_stamp");
        schedule=courseRS.getString("schedule.start")+" "+courseRS.getString("schedule.end");
        professor=courseRS.getString("professor.name");
        room=courseRS.getString("room.name");
        enlisted=courseRS.getInt("enlistment.course_enrolment_id");
        start=courseRS.getString("schedule.start");
        end=courseRS.getString("schedule.end");
        block=courseRS.getString("course_enrolment.block");
        completeSchedule=Schedule.schedulizeDay(day)+" "+Schedule.schedulizeTime(courseRS.getString("schedule.start"),courseRS.getString("schedule.end"));
%>
<div class="class-infobar">
    <div class="class-info">Block <%=block%></div>
    <div class="class-info"><%=completeSchedule%></div>
    <div class="class-info"><%=room%></div>
    <div class="class-info"><%=professor%></div>
    <%
        if(enlisted==0){
    %>
    <div id="add-button<%=id%>" onclick="enlist(<%=course_id%>,<%=id%>,<%=start%>,<%=end%>,'<%=day%>','<%=code%>')" class="addcart-button animate2s">Add To Cart</div>
    <%
        }
    %>
    <%
        if(enlisted>0){
    %>
    <div id="add-button<%=id%>" class="addcart-button animate2s added">Added</div>
    <%
        }
    %>
</div>
<%
    }
%>