<%-- 
    Document   : courseUnlistment
    Created on : May 19, 2016, 8:02:57 PM
    Author     : rub account
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="SAIS.SAISConnection"%>
<%
    SAISConnection con = new SAISConnection();
    con.connect();
    String studentId=request.getParameter("studentId");
    String courseEnrolmentId=request.getParameter("courseEnrolmentId");
    String sql = "delete from enlistment where student_id=? and course_enrolment_id=?";
    con.executePreparedQuery(sql,studentId,courseEnrolmentId);
    out.print(1);
%>