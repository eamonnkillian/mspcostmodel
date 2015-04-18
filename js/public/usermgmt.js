/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the Data Center Assets Cost Management function within the application. 
 */

$(function() {

    function toTitleCase(str)
    {
        // Many thanks to Greg Dean http://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
        return str.replace(/\w\S*/g, function(txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    }
    
    function checkTelenums(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).val('01234567890');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[0-9]*$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter numbers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkEmail(fieldName) {
        var meme = $(''+fieldName).val();
        emailValid = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if ($(''+fieldName).val() === "") {
            $(''+fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter an email address</div>');
            return errors = true;
        } else if (!emailValid.test($(''+fieldName).val())) {
            $(''+fieldName).after('<div class="addusermgmtAddFormErrors">&nbspThe email address entered is not valid</div>');
            return errors = true;
        } else {
            return errors = false;
        }
    }

    function checkPercentages(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter a quantity</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkNumerics(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter a number</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkNumbers(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter a number</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addusermgmtAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    

    $('#usermgmtFormShow').click(function() {
        $("#showusermgmtCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var insertString = "<div id='showusermgmtCostsFormContainer'><h2>Current Registered Users</h2><table id='showusermgmtCostsTable'>";
        var field = "";
        
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "password" ) {
                    insertString += "<td id='emptyshowusermgmtCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id"|| response[i] === "password" ) {
                        insertString += "<td id='emptyshowusermgmtCostsTableTD'></td>";
                    } else if (response[i] === "login") {
                        insertString += "<th>" + response[i + 1][j][field] + "</th>";
                    } else {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#usermgmtMainMIDMainSectionRHS").append(insertString);
            return false;
        }, 'json');

        return false;

    });

    $('#usermgmtFormAdd').click(function(e) {
        e.preventDefault();
        $("#showusermgmtCostsFormContainer").remove();
        var data = $(this).serializeArray();
        var tableName = data[0]['value'];
        var lastupdatedby = data[1]['value'];
        var url = $(this).attr('action');
        var numericArray = [];
        var fieldArray = [];
        var telenumsArray = [];
        var insertString = "<div id='showusermgmtCostsFormContainer'><h2>Add a Registered User</h2><form name='usermgmtFormAddSubmit' id='usermgmtFormAddSubmit' action='ajax_usermgmtAdd' method='post'><table id='showusermgmtCostsTable'>";
        insertString+="<input type='hidden' name='tableName' value='"+tableName+"'><input type='hidden' name='lastupdatedby' value='"+ lastupdatedby +"'>";
       
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowusermgmtCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }
              
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowusermgmtCostsTableTD'></td>";
                } else if (response[i] === "user_role") {
                    insertString += "<td><select class='selectLocation' id='"+response[i]+ "' name='"+response[i]+"'>";
                    $.ajax({
                    type:'GET',
                    url: 'ajax_getRole',
                    async: false,
                    dataType: 'json',
                    success: function(response1) {

                            for (var i=0; i<response1.length;i+=1){
                                insertString += "<option value='"+response1[i]['userroletype']+"'>"+response1[i]['userroletype']+"</option>";
                            }

                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                    }); 
                    insertString += "</select></td>";
                } else if (response[i] === "login") {
                    insertString += "<td><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' placeholder='Enter eMail Address' maxlength='30' autocomplete='off'></td>";
                    var duplicateCheck=response[i];
                } else if (response[i] === "password") {
                    insertString += "<td><input type='password' id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' placeholder='Enter Password' maxlength='30' autocomplete='off'></td>";
                } else if (response[i] === "mobile_phonenumber" || response[i] === "land_phonenumber") {
                    insertString += "<td><input id='" + response[i] + "' class='numeric' name='" + response[i] + "' maxlength='14'></td>";
                    telenumsArray.push(response[i]);
                } else {
                    insertString += "<td><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='14' autocomplete='off'></td>";
                    fieldArray.push(response[i]);
                }
                insertString += "</tr>";

            }
            insertString += "</table>";
            insertString += "<input type='submit' class='usermgmtAddInputSubmit' id='usermgmtFormAddButton' value='Add User'/>";
            insertString += "</form></div>";
            $("#usermgmtMainMIDMainSectionRHS").append(insertString);

            $('#usermgmtFormAddSubmit').submit(function(e) {
                e.preventDefault();
                var errors = false;
                var error_count = 0;
                var emailValid = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                $('.addusermgmtAddFormErrors').remove();

                if ($('#login').val() == "") {
                    $('#login').after('<div class="addusermgmtAddFormErrors">&nbspPlease enter an email address</div>');
                    errors = true;
                } else if (!emailValid.test($('#login').val())) {
                    $('#login').after('<div class="addusermgmtAddFormErrors">&nbspThe email address entered is not valid</div>');
                    errors = true;
                }

                if ($('#password').val() === "") {
                    $('#password').after('<div class="addusermgmtAddFormErrors">&nbspThere must be a password</div>');
                    errors = true;
                }
                
                $.each(fieldArray, function(key, value) {
                    errors = checkFields("#" + value);
                    if (errors === true) {
                       error_count+=1;
                    }
                });
                
                $.each(telenumsArray, function(key, value) {
                    errors = checkTelenums("#" + value);
                    if (errors === true) {
                       error_count+=1;
                    }
                });

                $.each(numericArray, function(key, value) {
                    errors = checkNumerics("#" + value);
                    if (errors === true) {
                       error_count+=1;
                    }
                });
                
                if (error_count === 0) {
                    var duplicateValue = $('#'+duplicateCheck).val();
                    var url1 = 'ajax_checkForDuplicate';
                    var data1 = {};

                    data1['value'] = duplicateValue;
                    data1['tableName'] = tableName;

                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {
                            if (response === "true") {         
                                error_count+=1;
                                $('#login').after('<div class="addusermgmtAddFormErrors">&nbspThis email is already registered</div>'); 
                            } 
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                      });  
                  }

                if (errors === false && error_count === 0) {
                    var data = $(this).serializeArray();
                    data[3]['value'] = CryptoJS.MD5(data[3]['value'], {asString: true}).toString();
                    var url = $(this).attr('action');

                    $.post(url, data, function(response) {
                        $('#usermgmtFormAddSubmit')[0].reset();
                        return false;
                    }, 'json');

                }

                return false;
            });
            return false;
        }, 'json');
        return false;
    });


    $('#usermgmtDeleteForm').submit(function(e) {
        e.preventDefault();
        $("#showusermgmtCostsFormContainer").remove();
        var data = $(this).serializeArray();
        var tableName = data[0]['value'];
        var url = $(this).attr('action');
        var insertString = "<div id='showusermgmtCostsFormContainer'><h2>Delete Users</h2><table id='showusermgmtCostsTable'>";
        var field = "";
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "password") {
                    insertString += "<td id='emptyshowusermgmtCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];
                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowusermgmtCostsTableTD'><a class='usermgmtDelete' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                    } else if (response[i] === "login") {
                        insertString += "<th class='"+j+"'>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i] === "password") {
                        insertString += "<td class='"+j+"' id='emptyshowusermgmtCostsTableTD'></td>";
                    } else {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#usermgmtMainMIDMainSectionRHS").append(insertString);
            
            $(".usermgmtDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                
                $.post('ajax_usermgmtDelete', {'id': uid, 'tableName': tableName}, function() {
                    
                }, 'json');
                $("." + colnum).hide();
                return false;
            });
            return false;
        }, 'json');

        return false;
    });
    
    
    $('#usermgmtFormModify').click(function(e) {
        e.preventDefault();
        $("#showusermgmtCostsFormContainer").remove();
        var data = $(this).serializeArray();
        var tableName = data[0]['value'];
        var lastupdatedby = data[1]['value'];
        var url = $(this).attr('action');
        var insertString = "<div id='showusermgmtCostsFormContainer'><h2>Modify Registered Users</h2><form name='modifyusermgmt'><table id='showusermgmtCostsTable'>";
        var field = "";
        var telenumsArray=[];
        var fieldArray=[];
        var emailArray = [];
        var colNames = [];
        var originalName=[];
       
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowusermgmtCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];
                
                for (var j = 0; j < response[i + 1].length; j++) {
                    
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowusermgmtCostsTableTD'><a class='usermgmtModify' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                        insertString += "<td class='"+j+"' id='emptyshowusermgmtCostsTableTD'></td>";
                    } else if (response[i] === "login") {
                        insertString += "<th class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></th>";
                        emailArray.push(response[i]+j);
                        originalName.push(response[i+1][j][field]);
                        var duplicateCheck=response[i];
                    } else if (response[i] === "password") {
                        insertString += "<td class='"+j+"'><input type='password' class='inputModify' id='" + response[i] + j +"' value='' placeholder='Type a new password' /></td>";
                    } else if (response[i] === "user_role") {
                        var checkCurrent = response[i + 1][j][field];
                        
                        insertString += "<td class='"+j+"'><select class='selectLocation' id='"+response[i]+j+ "' name='"+response[i + 1][j][field]+"'>";
                        $.ajax({
                        type:'GET',
                        url: 'ajax_getRole',
                        async: false,
                        dataType: 'json',
                        success: function(response1) {

                                for (var i=0; i<response1.length;i+=1){
                                    if (response1[i]['userroletype'] === checkCurrent) {
                                        insertString += "<option value='"+response1[i]['userroletype']+"' selected>"+response1[i]['userroletype']+"</option>";
                                    } else {
                                        insertString += "<option value='"+response1[i]['userroletype']+"'>"+response1[i]['userroletype']+"</option>";
                                    }
                                }

                            }, error: function(jqXHR, textStatus, errorThrown) {
                             window.location.assign('error/index');
                            }
                        }); 
                        insertString += "</select></td>";    
                                
                    } else if (response[i] === "mobile_phonenumber" || response[i] === "land_phonenumber") {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "' maxlength='16'/></td>";
                        telenumsArray.push(response[i]+j);
                    } else {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></td>";
                        fieldArray.push(response[i]+j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#usermgmtMainMIDMainSectionRHS").append(insertString);
            
            $(".usermgmtModify").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');   
                var errors = false;
                var error_count=0;
                $('.addusermgmtAddFormErrors').remove();
                
                $.each(emailArray, function(key, value) {
                    errors=checkEmail("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                }); 
                
                $.each(telenumsArray, function(key, value) {
                    errors=checkTelenums("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                });

                $.each(fieldArray, function(key, value) {
                    errors = checkFields("#" + value);
                    if (errors === true) {
                       error_count+=1;
                    }
                });
                
                
                var duplicateValue = $('#'+duplicateCheck+colnum).val();
                
                
                if (originalName[colnum] !== duplicateValue) {
                    var url1 = 'ajax_checkForDuplicate';
                    var data1 = {};

                    data1['value'] = duplicateValue;
                    data1['tableName'] = tableName;

                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {
                            if (response === "true") {         
                                error_count+=1;
                                $('#'+duplicateCheck+colnum).after('<div class="addusermgmtAddFormErrors">&nbspThis User is already registered.</div>'); 
                            } 
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                      });  
                }

                if (errors === false && error_count === 0) {
                    var myjsonforPosting = {}; 
                    myjsonforPosting["currentupdater"] = lastupdatedby;
                        $.each(colNames, function(key, value) {
                            
                            if (value === "password") {
                                if ($("#"+value + colnum).val() === '') {
                                    myjsonforPosting[''+value] = 'FALSE';
                                } else {
                                    myjsonforPosting[''+value] = CryptoJS.MD5($("#"+value + colnum).val(), {asString: true}).toString();
                                }
                            } else if (value !== "id" && value !== "lastupdatedby") {
                                myjsonforPosting[''+value] = $("#"+value + colnum).val();
                            } 
                        });
                    myjsonforPosting["id"] = uid;
                    myjsonforPosting["tableName"] = tableName;
                    
                    $.post('ajax_usermgmtModify', myjsonforPosting, function(o) {
                        console.log(o);

                    }, 'json');
                    $("." + colnum).hide();
                }
                return false;
            });
        
            return false;
        }, 'json');

        return false;
    });
    

    return false;
});
