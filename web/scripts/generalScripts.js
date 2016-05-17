/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function toggleText(id,status1,status2){
    sText=document.getElementById(id).innerHTML;
    if(sText==status1){
        document.getElementById(id).innerHTML=status2;
    }
    else{
        document.getElementById(id).innerHTML=status1;
    }
}