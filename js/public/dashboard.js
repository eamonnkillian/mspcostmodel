/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {   
    $('#callUserManagement').submit(function() {    
        var url = $(this).attr('action');
        $.get(url, function(response) {
            $("body").load(response);
        });
        return false;
    });
    
});
