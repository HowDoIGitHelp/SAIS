/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadEnrolment(id){
    
    if($("#show-button"+id).html()=="show"){
        $("#course-enrolment"+id).load("courseEnrolment.jsp",{id:id});
    }
    if($('#show-button'+id).html()=='hide'){
        $("#course-enrolment"+id).html(" ");
    }
    toggleText("show-button"+id,"show","hide");
}
function enlist(id,start,end,strDay){
    $.post("../dbupdate/courseEnlistment.jsp", {studentId:1,courseEnrolmentId:id});
    $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1},alert("added to cart"));
    scheduleSlot(start,end,strDay);
    toggleText("add-button"+id,"add to cart","added");
    $("#add-button"+id).prop("onclick",null);//removeAttr doesnt work on ie
}
function unlist(id,start,end,strDay){
    $.post("../dbupdate/courseUnlistment.jsp", {studentId:1,courseEnrolmentId:id});
    $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1},alert("removed from cart"));
    unscheduleSlot(start,end,strDay);
    toggleText("add-button"+id,"add to cart","added");
    $("#add-button"+id).attr("onclick","enlist("+id+")");
}
function fillSchedule(row,col){
   $("#"+row+"-"+col).html("x"); 
}
function eraseSchedule(row,col){
   $("#"+row+"-"+col).html(" "); 
}
function scheduleSlot(start,end,strDay){
    console.log(strDay);
    for(var i=0;i<strDay.length;i++){
        console.log(i+" "+strDay.charAt(i));
        if(strDay.charAt(i)=='1'){
            for(var j=start;j<end;j+=0.5){
                fillSchedule((j*2-12),i);
            }
        }
    }
}
function unscheduleSlot(start,end,strDay){
    console.log(strDay);
    for(var i=0;i<strDay.length;i++){
        console.log(i+" "+strDay.charAt(i));
        if(strDay.charAt(i)=='1'){
            for(var j=start;j<end;j+=0.5){
                eraseSchedule((j*2-12),i);
            }
        }
    }
}
