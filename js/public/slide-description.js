/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('#showmemore').click(function(){
        $('#main').css('display','none');
        $('#main1').css('display','block');
    });
    
    $('#showmeless').click(function(){
        $('#main1').css('display','none');
        $('#main').css('display','block');
    });

});

