/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the registration of new users function within the application. 
 * Finally completed on 27 May 2014 ...EJK
 * 
 */

$(function() {

    function checkNumbers(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="regloginErrors">&nbspPlease enter a valid phone number</div>');
            return 1;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[0-9]*$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="regloginErrors">&nbspPlease enter numbers only</div>');
                return 1;
            } else {
                return 0;
            }
        }
    }

    function checkeMail(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="regloginErrors">&nbspPlease enter an eMail Address</div>');
            return 1;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="regloginErrors">&nbspPlease enter a valid eMail address</div>');
                return 1;
            } else {
                return 0;
            }
        }
    }

    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="regloginErrors">&nbspThis field cannot be empty</div>');
            return 1;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9.;,:"'_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="regloginErrors">&nbspPlease enter alphanumeric characters only</div>');
                return 1;
            } else {
                return 0;
            }
        }
    }

    function checkDuplicate() {
        var dataforcheck = {};
        dataforcheck['login'] = $('#regloginname').val();
        $.ajax({
            type: 'GET',
            url: 'register/checkForDuplicate',
            data: dataforcheck,
            async: false,
            success: function(response) {
                if (response === "Failure") {
                    $('#regloginname').after('<div class="regloginErrors">&nbspUnfortunately the email address entered is already registered</div>');
                } else {
                    var url = 'register/registerExecute';
                    var data = $('#mainpageFormAdd').serializeArray();
                    data[2]['value']=CryptoJS.MD5($('#regpassword').val(), {asString: true}).toString();
                    $.post(url, data, function(response) {
                        if (response === "Success") {
                            window.location.assign('register/success');
                        } else {
                            window.location.assign('register');
                        }
                        return false;
                    });
                }
            }, error: function(jqXHR, textStatus, errorThrown) {
                window.location.assign('error/index');
            }
        });
    }

    $('#mspRegistrationInputSubmit').click(function(e) {
        e.preventDefault();
        $('.regloginErrors').remove();
        var error_count = 0;
        error_count += checkeMail('#regloginname');
        error_count += checkFields('#regpassword');
        error_count += checkFields('#regFirstname');
        error_count += checkFields('#regSurname');
        error_count += checkNumbers('.mspRegistrationInputMobile');
        error_count += checkNumbers('.mspRegistrationInputPhone');
        if (error_count === 0) {
            checkDuplicate($('#regloginname').val());
        }
        return false;
    });

});
