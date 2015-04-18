/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {

    $('#loginForm').on('submit', function() {

        var emailValid = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var errors = false;
        $('.loginErrors').remove();


        if ($('#loginname').val() == "") {
            $('#loginname').after('<div class="loginErrors">&nbspPlease enter an email address</div>');
            errors = true;
        } else if (!emailValid.test($('#loginname').val())) {
            $('#loginname').after('<div class="loginErrors">&nbspThe email address entered is not a valid format</div>');
            errors = true;
        }

        if ($('#password').val() == "") {
            $('#password').after('<div class="loginErrors">&nbspPlease enter a password</div>');
            errors = true;
        }

        if (errors == false) {
            event.preventDefault();
            var data = $(this).serializeArray();
            var url = $(this).attr('action');
            var jsonObj = {};

            $.each(data, function() {
                if (jsonObj[this.name] !== undefined) {
                    if (!jsonObj[this.name].push) {
                        jsonObj[this.name] = [jsonObj[this.name]];
                    }
                    jsonObj[this.name].push(this.value || '');
                } else {
                    jsonObj[this.name] = this.value || '';
                }
            });

            var url = $(this).attr('action');
            jsonObj['password'] = CryptoJS.MD5(jsonObj['password'], {asString: true}).toString();

            $.ajax({
                url: $(this).attr('action'),
                type: $(this).attr('method'),
                data: jsonObj,
                success: function(response) {
                    if (response === "success") {
                        window.location.assign('costs/index');
                    } else {
                        window.location.assign('login');
                    }
                }
            });
            
            return false;
        } else {
            return false;
        }
    });

});
