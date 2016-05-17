/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadEnrolment(id){
    
    if(document.getElementById("show-button"+id).innerHTML=="show"){
        $("#course-enrolment"+id).load("courseEnrolment.jsp?id="+id);
    }
    if(document.getElementById("show-button"+id).innerHTML=="hide"){
        document.getElementById("course-enrolment"+id).innerHTML=" ";
    }
    toggleText("show-button"+id,"show","hide");
}