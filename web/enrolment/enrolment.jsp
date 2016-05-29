<%@page import="java.awt.Point"%>
<%@page import="SAIS.Schedule"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="SAIS.SAISConnection"%>
<%
    SAISConnection con = new SAISConnection();
    Schedule sched = new Schedule();
    con.connect();
%>
<%@page contentType="html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Enlistment</title>
        <link rel="stylesheet" href="../css/global.css"/>
        <link rel="stylesheet" href="../css/enlistment.css"/>
        <script src="../js/jquery-min.js"></script>
        <script src="../js/global.js"></script>
        <script src="../js/enlistment.js"></script>
    </head>
    <body>
        <div id="site-header" class="theme-bg-color">
            <div id="site-id" class="animate2s">
                <div id="site-logo-container"></div>
                <div id="site-name">UP SAIS</div>
            </div>
            
            <div id="site-user" class="animate2s">
                <div id="user-icon" class="icon-holder">
                    <img alt="user" src="../resources/svg/user.svg"/>
                </div>
                <div id="user-name">Mark Lester</div>
                <div id="user-box" class="ubox-collapse animate2s">
                    <div id="sid-label">SAIS ID</div>
                    <div id="sais-id" class="theme-font-color">111021</div>
                    <div class="user-button">Sign out</div>
                    <div class="user-button">Change My Password</div>
                </div>
            </div>
            <!--
            <div id="site-search">
                <div id="search-container">
                    <input type="text" placeholder="Search Menu" id="search-input"/>
                </div>
                <div id="search-icon" class="icon-holder">
                    <img alt="user" src="resources/svg/search2.svg"/>
                </div>
                
            </div>  
            -->  
        </div>
        <div class="site-subheader">
            <div class="subheader-center">
                <div class="subheader-label">ENLISTMENT</div>
                <div class="subheader-tab animate2s" id="schedule-matrix">
                    <div class="sh-tab-icon icon-holder">
                        <img src="../resources/svg/schedule.svg" alt="calendar"/>
                    </div>
                    <div class="sh-tab-label">Schedule Matrix</div>
                </div>

                <div class="subheader-tab animate2s" id="shopping-cart">
                    <div class="sh-tab-icon icon-holder">
                        <img src="../resources/svg/cart.svg" alt="cart"/>
                    </div>
                    <div class="sh-tab-label">Shopping Cart</div>
                </div>

                <div class="subheader-tab animate2s sel" id="search-classes">
                    <div class="sh-tab-icon icon-holder">
                        <img src="../resources/svg/search1.svg" alt="search classes"/>
                    </div>
                    <div class="sh-tab-label">Search Classes</div>
                </div>

                
            </div>
        </div>
        <div class="page-content" id="panel">
            <div id="slider" class="animate3s">
                <div id="available-courses" class="slider-panel">
                    <div id="class-searcher">
                        <%
                            String filter = request.getParameter("filter");
                            filter=filter==null?"":filter;
                            ResultSet courseRS=con.executeQuery("select count(*) from course where (course.code like '%"+filter+"%' or course.`name` like '%"+filter+"%')");
                            courseRS.next();
                            int courseCount=courseRS.getInt(1);
                            if(filter.equals("")){
                                filter="";
                        %>
                        <div id="search-status"><%=courseCount%> Available Courses</div>
                        <%
                            }
                            else{
                        %>
                        <div id="search-status"><%=courseCount%> Search Results for "<%=filter%>"</div>
                        <%
                            }
                        %>
                        <input type="button" value="Search" id="search-class-button" class="animate2s" onclick="filterCourses()"/>
                        <input type="text" class="animate2s" id="class-search-input" placeholder="Search Class Number"/>
                    </div>
                    <!-- PUT CLASS SEARCH RESULTS HERE -->
                    <div class="search-results-container">
                        <%
                            int id;
                            String code;
                            String name;
                            String field;
                            String description;
                            String stripe;
                            int ctr=0;
                            courseRS=con.executeQuery("select * from course where (course.code like '%"+filter+"%' or course.`name` like '%"+filter+"%')");
                            while(courseRS.next()){
                                ctr++;
                                stripe=ctr%2==1?" odd":"";
                                id=courseRS.getInt("id");
                                code=courseRS.getString("code");
                                name=courseRS.getString("name");
                                description=courseRS.getString("description");
                        %>
                        
                        <div class="search-result<%=stripe%>">
                            <div class="class-header">
                                <div class="class-number"><%=code%></div>
                                <div class="class-description"><%=name%></div>
                                <div id="show-button<%=id%>" class="loadclass-button animate2s" onclick="loadEnrolment(<%=id%>)">Show</div>
                            </div>
                            <div id="course-enrolment<%=id%>"></div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <!------------------------->
                </div>
                <div id="enlisted-courses" class="slider-panel">
                    <%
                    ResultSet courseEnlistmentRS=con.executeQuery("select count(*) from enlistment where student_id=1;;");
                    courseEnlistmentRS.next();
                    int enlistedCoursesCount=courseEnlistmentRS.getInt(1);
                    %>
                    <div id="class-searcher">
                        <div id="search-status"><a id="enlisted-courses-count"><%=enlistedCoursesCount%></a> Classes in Shopping Cart</div>
                        <!--<input type="button" value="Empty Shopping Cart" class="enlist-button animate2s"/>-->
                    </div>
                    
                    <!-- PUT CLASS SHOPPING CART CONTENT HERE -->
                    <div class="search-results-container">
                    <%
                    String student_id="1";
                    int course_enrolment_id;
                    String day;
                    String schedule;
                    String start;
                    String end;
                    String professor;
                    String room;
                    String cname;
                    String completeSchedule;
                    String block;
                    int course_id;
                    ctr=0;
                    courseEnlistmentRS=con.executeQuery("select * from course,day,schedule,course_enrolment,room,professor where day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id and course_enrolment.id in (select course_enrolment_id from enlistment where student_id="+student_id+") order by course_enrolment.id");
                    while(courseEnlistmentRS.next()){
                        ctr++;
                        stripe=ctr%2==1?" odd":"";
                        course_enrolment_id=courseEnlistmentRS.getInt("course_enrolment.id");
                        code=courseEnlistmentRS.getString("course.code");
                        day=courseEnlistmentRS.getString("course_enrolment.week_stamp");
                        schedule=courseEnlistmentRS.getString("schedule.start")+" "+courseEnlistmentRS.getString("schedule.end");
                        completeSchedule=Schedule.schedulizeDay(day)+" "+Schedule.schedulizeTime(courseEnlistmentRS.getString("schedule.start"),courseEnlistmentRS.getString("schedule.end"));
                        start=courseEnlistmentRS.getString("schedule.start");
                        end=courseEnlistmentRS.getString("schedule.end");
                        professor=courseEnlistmentRS.getString("professor.name");
                        room=courseEnlistmentRS.getString("room.name");
                        course_id=courseEnlistmentRS.getInt("course.id");
                        cname=courseEnlistmentRS.getString("name");
                        block=courseEnlistmentRS.getString("course_enrolment.block");
                    %>
                        <div class="search-result<%=stripe%>">
                            <div class="class-header">
                                <div class="class-number"><%=code%></div>
                                <div class="class-description"><%=cname%></div>
                            </div>
                            <div class="class-infobar">
                                <div class="class-info">Block <%=block%></div>
                                <div class="class-info"><%=completeSchedule%></div>
                                <div class="class-info"><%=room%></div>
                                <div class="class-info"><%=professor%></div>
                                <div class="removecart-button animate2s" onclick="unlist(<%=course_id%>,<%=course_enrolment_id%>,<%=start%>,<%=end%>,'<%=day%>','<%=code%>')">Remove From Cart</div>
                            </div>
                        </div>
                    <%}%>
                    </div>
                    
                    <!------------------------->
                </div>
                <div id="schedule" class="slider-panel">
                    <table id="sched-matrix">
                        <tr class="sched-tr">
                            <td></td>
                            <td>Sunday</td>
                            <td>Monday</td>
                            <td>Tuesday</td>
                            <td>Wednesday</td>
                            <td>Thursday</td>
                            <td>Friday</td>
                            <td>Saturday</td>
                            
                        </tr>
                        <tr class="sched-tr">
                            <td>7:00 AM</td><td id="0-0"></td><td id="0-1"></td><td id="0-2"></td><td id="0-3"></td><td id="0-4"></td><td id="0-5"></td><td id="0-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>7:30 AM</td><td id="1-0"></td><td id="1-1"></td><td id="1-2"></td><td id="1-3"></td><td id="1-4"></td><td id="1-5"></td><td id="1-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>8:00 AM</td><td id="2-0"></td><td id="2-1"></td><td id="2-2"></td><td id="2-3"></td><td id="2-4"></td><td id="2-5"></td><td id="2-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>8:30 AM</td><td id="3-0"></td><td id="3-1"></td><td id="3-2"></td><td id="3-3"></td><td id="3-4"></td><td id="3-5"></td><td id="3-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>9:00 AM</td><td id="4-0"></td><td id="4-1"></td><td id="4-2"></td><td id="4-3"></td><td id="4-4"></td><td id="4-5"></td><td id="4-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>9:30 AM</td><td id="5-0"></td><td id="5-1"></td><td id="5-2"></td><td id="5-3"></td><td id="5-4"></td><td id="5-5"></td><td id="5-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>10:00 AM</td><td id="6-0"></td><td id="6-1"></td><td id="6-2"></td><td id="6-3"></td><td id="6-4"></td><td id="6-5"></td><td id="6-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>10:30 AM</td><td id="7-0"></td><td id="7-1"></td><td id="7-2"></td><td id="7-3"></td><td id="7-4"></td><td id="7-5"></td><td id="7-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>11:00 AM</td><td id="8-0"></td><td id="8-1"></td><td id="8-2"></td><td id="8-3"></td><td id="8-4"></td><td id="8-5"></td><td id="8-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>11:30 AM</td><td id="9-0"></td><td id="9-1"></td><td id="9-2"></td><td id="9-3"></td><td id="9-4"></td><td id="9-5"></td><td id="9-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>12:00 PM</td><td id="10-0"></td><td id="10-1"></td><td id="10-2"></td><td id="10-3"></td><td id="10-4"></td><td id="10-5"></td><td id="10-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>12:30 PM</td><td id="11-0"></td><td id="11-1"></td><td id="11-2"></td><td id="11-3"></td><td id="11-4"></td><td id="11-5"></td><td id="11-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>1:00 PM</td><td id="12-0"></td><td id="12-1"></td><td id="12-2"></td><td id="12-3"></td><td id="12-4"></td><td id="12-5"></td><td id="12-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>1:30 PM</td><td id="13-0"></td><td id="13-1"></td><td id="13-2"></td><td id="13-3"></td><td id="13-4"></td><td id="13-5"></td><td id="13-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>2:00 PM</td><td id="14-0"></td><td id="14-1"></td><td id="14-2"></td><td id="14-3"></td><td id="14-4"></td><td id="14-5"></td><td id="14-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>2:30 PM</td><td id="15-0"></td><td id="15-1"></td><td id="15-2"></td><td id="15-3"></td><td id="15-4"></td><td id="15-5"></td><td id="15-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>3:00 PM</td><td id="16-0"></td><td id="16-1"></td><td id="16-2"></td><td id="16-3"></td><td id="16-4"></td><td id="16-5"></td><td id="16-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>3:30 PM</td><td id="17-0"></td><td id="17-1"></td><td id="17-2"></td><td id="17-3"></td><td id="17-4"></td><td id="17-5"></td><td id="17-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>4:00 PM</td><td id="18-0"></td><td id="18-1"></td><td id="18-2"></td><td id="18-3"></td><td id="18-4"></td><td id="18-5"></td><td id="18-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>4:30 PM</td><td id="19-0"></td><td id="19-1"></td><td id="19-2"></td><td id="19-3"></td><td id="19-4"></td><td id="19-5"></td><td id="19-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>5:00 PM</td><td id="20-0"></td><td id="20-1"></td><td id="20-2"></td><td id="20-3"></td><td id="20-4"></td><td id="20-5"></td><td id="20-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>5:30 PM</td><td id="21-0"></td><td id="21-1"></td><td id="21-2"></td><td id="21-3"></td><td id="21-4"></td><td id="21-5"></td><td id="21-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>6:00 PM</td><td id="22-0"></td><td id="22-1"></td><td id="22-2"></td><td id="22-3"></td><td id="22-4"></td><td id="22-5"></td><td id="22-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>6:30 PM</td><td id="23-0"></td><td id="23-1"></td><td id="23-2"></td><td id="23-3"></td><td id="23-4"></td><td id="23-5"></td><td id="23-6"></td>
                        </tr>
                        <tr class="sched-tr">
                            <td>7:00 PM</td><td id="24-0"></td><td id="24-1"></td><td id="24-2"></td><td id="24-3"></td><td id="24-4"></td><td id="24-5"></td><td id="24-6"></td>
                        </tr>
                    </table>
                    <div id="schedule-populate">
                    <%
                    ResultSet courseEnlistmentRS2=con.executeQuery("select * from course,day,schedule,course_enrolment,room,professor where day.id=course_enrolment.day_id and schedule.id=course_enrolment.schedule_id and professor.id=course_enrolment.professor_id and room.id = course_enrolment.room_id and course.id=course_enrolment.course_id and course_enrolment.id in (select course_enrolment_id from enlistment where student_id="+student_id+")");
                    while(courseEnlistmentRS2.next()){
                        code=courseEnlistmentRS2.getString("course.code");
                        day=courseEnlistmentRS2.getString("course_enrolment.week_stamp");
                        start=courseEnlistmentRS2.getString("schedule.start");
                        end=courseEnlistmentRS2.getString("schedule.end");
                    %>
                        <script>scheduleSlot(<%=start%>,<%=end%>,'<%=day%>','<%=code%>')</script>
                    <%}%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
