
/*-------------------- GLOBAL VARIABLES & OBJECT DEFINITIONS --------------------------------*/

var sm1 = '<div class="submenu theme-bghover animate2s">My Weekly Schedule</div>' + 
                    '<div class="submenu theme-bghover animate2s">My Assigments</div>' +
                    '<div class="submenu theme-bghover animate2s">Exams Schedule</div>';

var sm2 = '<div class="submenu theme-bghover animate2s">View my Personal Info</div>' + 
                    '<div class="submenu theme-bghover animate2s">Update my Personal Info</div>';

var sm3 = '<div class="submenu theme-bghover animate2s">View My Grades</div>'
           + '<div class="submenu theme-bghover animate2s">View My Milestones</div>'
           + '<div class="submenu theme-bghover animate2s">View Unofficial Transcript</div>'
           + '<div class="submenu theme-bghover animate2s">My Course History</div>';

var sm4 = '<div class="submenu theme-bghover animate2s">My Tentative Schedule</div>'
           + '<div class="submenu theme-bghover animate2s" onclick="location.href=\'enrolment/enrolment.jsp\';">Enlist Classes</div>'
           + '<div class="submenu theme-bghover animate2s">Drop Classes</div>'
           + '<div class="submenu theme-bghover animate2s">Enrollment Dates</div>';

var sm5 = '<div class="submenu theme-bghover animate2s">Account Inquiry</div>'
           + '<div class="submenu theme-bghover animate2s">View Financial Aid</div>'
           + '<div class="submenu theme-bghover animate2s">Enroll in Payment Plan</div>';

var sm6 = '<div class="submenu theme-bghover animate2s">Contact HelpDesk</div>'
           + '<div class="submenu theme-bghover animate2s">Contact eUP</div>'
           + '<div class="submenu theme-bghover animate2s">About SAIS</div>';

var userBoxStatus = 0;
/*-------------------------------------------------------------------------------------------*/

/*--------------------EVENT LISTENERS -------------------------------------------------------*/

$(document).ready(function () {

    $('#menu1').click(function () {
        hideSubmenu(2);
        showSubmenu(1, sm1);
    });
    $('#menu2').click(function () {
        hideSubmenu(2);
        showSubmenu(1, sm2);
    });
    $('#menu3').click(function () {
        hideSubmenu(2);
        showSubmenu(1, sm3);
    });

    $('#menu4').click(function () {
        hideSubmenu(1);
        showSubmenu(2, sm4);
    });
    $('#menu5').click(function () {
        hideSubmenu(1);
        showSubmenu(2, sm5);
    });
    $('#menu6').click(function () {
        hideSubmenu(1);
        showSubmenu(2, sm6);
    });

    $('#site-user').click(function () {
        if (userBoxStatus == 0) {
            $('#user-box').attr('class', 'ubox-expand animate2s');
            userBoxStatus = 1;
        }
        else {
            $('#user-box').attr('class', 'ubox-collapse animate2s');
            userBoxStatus = 0;
        }
    });
    
});
/*-------------------------------------------------------------------------------------------*/

/*----------------------METHOD DEFINITIONS ---------------------------------------------------*/


function showSubmenu(i, submenu){
    $('#submenu-cont' + i).attr('class', 'submenu-container animate3s expand');
    $('#submenu-cont' + i).html(submenu);
}

function hideSubmenu(i){
    $('#submenu-cont' + i).attr('class', 'submenu-container animate3s collapse');
}

/*--------------------------------------------------------------------------------------------*/