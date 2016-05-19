<%-- 
    Document   : courseEnlistment.jsp
    Created on : May 17, 2016, 4:24:44 PM
    Author     : rub account
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="SAIS.SAISConnection"%>
<%
    SAISConnection con = new SAISConnection();
    con.connect();
    String studentId=request.getParameter("studentId");
    String courseEnrolmentId=request.getParameter("courseEnrolmentId");
    String sql = "insert into enlistment(student_id, course_enrolment_id) values(?,?)";
    con.executePreparedQuery(sql,studentId,courseEnrolmentId);
    out.print(1);
%>