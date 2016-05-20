/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadEnrolment(id){
    
    if(document.getElementById("show-button"+id).innerHTML=="show"){
        $("#course-enrolment"+id).load("courseEnrolment.jsp",{id:id});
    }
    if(document.getElementById("show-button"+id).innerHTML=="hide"){
        document.getElementById("course-enrolment"+id).innerHTML=" ";
    }
    toggleText("show-button"+id,"show","hide");
}
function enlist(id){
    $.post("../dbupdate/courseEnlistment.jsp", {studentId:1,courseEnrolmentId:id});
    //$("#schedule-matrix").load("enrolment.jsp #schedule-matrix",{studentId:1},alert("updated schedule"));
    $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1},alert("added to cart"));
    toggleText("add-button"+id,"add to cart","added");
    document.getElementById("add-button"+id).removeAttribute("onclick");
}
function unlist(id){
    $.post("../dbupdate/courseUnlistment.jsp", {studentId:1,courseEnrolmentId:id});
    //$("#schedule-matrix").load("enrolment.jsp #schedule-matrix",{studentId:1},alert("updated schedule"));
    $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1},alert("removed from cart"));
    toggleText("add-button"+id,"add to cart","added");
    document.getElementById("add-button"+id).setAttribute("onclick","enlist("+id+")");
}
function fillSchedule(row,col){
   document.getElementById(row+"-"+col).innerHTML="x"; 
}
