

/*----------------EVENT LISTENERS --------------------------*/
$(document).ready(function () {
    $('#search-classes').click(function () {
        $('.subheader-tab').attr('class', 'subheader-tab animate2s');
        $(this).attr('class', 'subheader-tab animate2s sel');
        showPane(0);
    });
    $('#shopping-cart').click(function () {
        $('.subheader-tab').attr('class', 'subheader-tab animate2s');
        $(this).attr('class', 'subheader-tab animate2s sel');
        showPane(1);
    });
    $('#schedule-matrix').click(function () {
        $('.subheader-tab').attr('class', 'subheader-tab animate2s');
        $(this).attr('class', 'subheader-tab animate2s sel');
        showPane(2);
    });
});
/*-----------------------------------------------------------*/

/*----------------METHOD DEFINITIONS -------------------------*/

function showPane(paneNumber){
    $('#slider').css('transform', 'translate(' + (-950 * paneNumber) + 'px)');
}
function loadEnrolment(id){
    
    if($("#show-button"+id).html()=="Show"){
        $("#course-enrolment"+id).load("schedule.jsp",{id:id});
        
    }
    if($('#show-button'+id).html()=='Hide'){
        $("#course-enrolment"+id).html(" ");
    }
    toggleText("show-button"+id,"Show","Hide");
}
function enlist(cid,id,start,end,strDay,code){
    $.post("../dbupdate/courseEnlistment.jsp", {studentId:1,courseEnrolmentId:id}).done(function(){
        $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1});
        $("#course-enrolment"+cid).load("schedule.jsp",{id:cid});
        scheduleSlot(start,end,strDay,code);
    });
    /*scheduleSlot(start,end,strDay,code);
    toggleText("add-button"+id,"Add To Cart","Added");
    $("#add-button"+id).addClass("added");
    $("#add-button"+id).prop("onclick",null);//removeAttr doesnt work on ie
    var count=$("#enlisted-courses-count").html();
    $("#enlisted-courses-count").html(parseInt(count)+1);
    $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1},function( response, status, xhr ) {
        if (status == "success" ) {
            alert("successfully enlisted");
        }
    });
    */
}
function unlist(cid,id,start,end,strDay,code){
    $.post("../dbupdate/courseUnlistment.jsp", {studentId:1,courseEnrolmentId:id}).done(function(){
        $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1});
        $("#course-enrolment"+cid).load("schedule.jsp",{id:cid});
        unscheduleSlot(start,end,strDay,code);
    });/*
    unscheduleSlot(start,end,strDay,code);
    toggleText("add-button"+id,"Add To Cart","Added");
    $("#add-button"+id).removeClass("added");
    $("#add-button"+id).attr("onclick","enlist("+id+","+start+","+end+",'"+strDay+"','"+code+"')");
    var count=$("#enlisted-courses-count").html();
    $("#enlisted-courses-count").html(parseInt(count)-1);
    $("#enlisted-courses").load("enrolment.jsp #enlisted-courses",{studentId:1});*/
    
}
function fillSchedule(row,col,code){
   $("#"+row+"-"+col).css("color","white");
   if($("#"+row+"-"+col).html()!=""){
    $("#"+row+"-"+col).css("background-color","indianred");
    var overlap=$("#"+row+"-"+col).html();
    $("#"+row+"-"+col).html(overlap+"/"+code);
    return "warning "+code+" overlaps with "+overlap;
   }
   else{
    $("#"+row+"-"+col).css("background-color","#16a085"); 
    $("#"+row+"-"+col).html(code);
    return "";
   }
}
function eraseSchedule(row,col,code){
   if($("#"+row+"-"+col).html().includes("/")){
    $("#"+row+"-"+col).css("background-color","#16a085");
    var overlap=$("#"+row+"-"+col).html();
    var newSched=overlap.replace(code,"");
    newSched=newSched.replace("/","");
    $("#"+row+"-"+col).html(newSched);
   }
   else{
    $("#"+row+"-"+col).css("background-color","white"); 
    $("#"+row+"-"+col).html("");
   }
}
function scheduleSlot(start,end,strDay,code){
    var overlap="";
    var returnOverlap
    for(var i=0;i<strDay.length;i++){
        if(strDay.charAt(i)=='1'){
            for(var j=start;j<end;j+=0.5){
                returnOverlap=fillSchedule((j*2-14),i,code);
                if(returnOverlap!="")
                    overlap=returnOverlap;
            }
        }
    }
    if(overlap!="")
        alert(overlap);
}
function unscheduleSlot(start,end,strDay,code){
    for(var i=0;i<strDay.length;i++){
        if(strDay.charAt(i)=='1'){
            for(var j=start;j<end;j+=0.5){
                eraseSchedule((j*2-14),i,code);
            }
        }
    }
}
function filterCourses(){
    var filter=$("#class-search-input").val();
    $("#available-courses").load("enrolment.jsp #available-courses",{studentId:1,filter:filter});
}
var xhr = function () {
        alert(httpc.readyState+" "+httpc.status);
        if (httpc.readyState === 4 && httpc.status === 200) {
            res = httpc.responseText.toString();
            alert(res);
            if (res === "1") {
                alert("success");
            }
        }
    };
function toggleText(id,status1,status2){
    sText=document.getElementById(id).innerHTML;
    if(sText==status1){
        document.getElementById(id).innerHTML=status2;
    }
    else{
        document.getElementById(id).innerHTML=status1;
    }
}

/*------------------------------------------------------------*/

