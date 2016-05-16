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
                <b><%=code%> <%=name%> <%=description%> <div onclick="loadEnrolment(<%=id%>)">show</div></b>
                <div id="course-enrolment<%=id%>">
                </div>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
