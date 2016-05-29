
/*-------------------- GLOBAL VARIABLES & OBJECT DEFINITIONS --------------------------------*/

var userBoxStatus = 0;
/*-------------------------------------------------------------------------------------------*/

/*--------------------EVENT LISTENERS -------------------------------------------------------*/

$(document).ready(function () {

  
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


/*--------------------------------------------------------------------------------------------*/