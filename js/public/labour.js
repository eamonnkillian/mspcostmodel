/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the Labour Cost Management function within the application. 
 */

$(function() {

    function toTitleCase(str)
    {
        // Many thanks to Greg Dean http://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
        return str.replace(/\w\S*/g, function(txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    }

    function checkPercentages(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).val('0.00');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addlabourAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkIntegers(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).val('0');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\s*-?[0-9]{1,10}\s*$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addlabourAddFormErrors">&nbspPlease enter integers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    } 

    function checkNumerics(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).val('0.00');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addlabourAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addlabourAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9.;,:"'_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addlabourAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkNumbers(fieldName) {
        if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addlabourAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    $('#labourFormShow').click(function() {
        $("#showLabourCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var insertString = "<div id='showLabourCostsFormContainer'><h2>Current Labour Costs</h2><table id='showLabourCostsTable'>";
        var field = "";
        var thisCurrency = [];

        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                    } else if (response[i] === "employee_category") {
                        insertString += "<th nowrap>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];
                        insertString += "<td class='currencyShow'>" + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/update/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/numbers_of_this/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/employee_type/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_allocation/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + " %</td>";
                    } else {    
                        insertString += "<td><span id='currencyShow' class='currency" + j + "'></span> " + response[i + 1][j][field] + "</td>";
                    }

                }

                insertString += "</tr>";

            }
            insertString += "</table></div>";
            $("#labourMainMIDMainSectionRHS").append(insertString);
            for (var i = 0; i <= thisCurrency.length; i++) {
                $('.currency' + i).text('' + thisCurrency[i]);
            }
            return false;
        }, 'json');

        return false;

    });

    $('#labourFormAdd').click(function() {
        $("#showLabourCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var lastupdatedby = $('#lastupdatedby').val();
        var percentArray = [];
        var numericArray = [];
        var fieldArray = [];
        var integerArray = [];
        var insertString = "<div id='showLabourCostsFormContainer'><h2>Add Labour Costs</h2><form name='labourAddLabour' id='labourFormAddSubmit' action='ajax_LabourAdd'><table id='showLabourCostsTable'>";
        insertString += "<input type='hidden' name='tableName' value='labour'><input type='hidden' name='lastupdatedby' value='" + lastupdatedby + "'>";
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                switch (response[i]) {
                    case "id":
                        insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                        break;
                    case "lastupdatedby":
                        insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                        break;
                    case "lastupdated":
                        insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                        break;
                    case "employee_category":
                        insertString += "<th><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></th>";
                        var duplicateCheck = response[i];
                        fieldArray.push(response[i]);
                        break;
                    case ("numbers_of_this_employee"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'></td>";
                        integerArray.push(response[i]);
                        break;
                    case ("award_bonus_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("pension_contribution"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='8'></td>";
                        percentArray.push(response[i]);
                        break;
                    case ("expenses_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("maternity_paternity_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("sickness_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("legal_challenges_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("redundancy_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("jury_civil_duties_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("employer_social_security_allocation"):
                        insertString += "<td class='percentageshowLabourCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='4'> %</td>";
                        percentArray.push(response[i]);
                        break;
                    case ("employee_type"):
                        insertString += "<td><select class='selectCurrency' id='" + response[i] + "' name='" + response[i] + "'><option value='Central Performer'>Central Performer</option><option value='On-site Performer'>On-Site Performer</option><option value='Non-Performer'>Non-Performer</option></select></td>";
                        break;
                    case ("currency"):

                        insertString += "<td><select class='selectCurrency' id='" + response[i] + "' name='" + response[i] + "'>";

                        $.ajax({
                            type: 'GET',
                            url: 'ajax_getCurrency',
                            async: false,
                            dataType: 'json',
                            success: function(response) {

                                for (var i = 0; i < response.length; i += 1) {
                                    insertString += "<option value='" + response[i] + "'>" + response[i] + "</option>";
                                }

                            }, error: function(jqXHR, textStatus, errorThrown) {
                                window.location.assign('error/index');
                            }
                        });
                        insertString += "</select></td>";
                        break;
                    default:
                        insertString += "<td class='monetaryshowLabourCostsTableTD'><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";
                        numericArray.push(response[i]);
                        break;
                }

                insertString += "</tr>";

            }
            insertString += "</table>";
            insertString += "<p><input class='labourAddInputSubmit' id='labourFormAddButton' type='submit' value='Add Labour Costs'/></p>";
            insertString += "</form></div>";
            $("#labourMainMIDMainSectionRHS").append(insertString);

            $('#labourFormAddSubmit').submit(function(e) {
                e.preventDefault();

                var errors = false;
                var error_count = 0;
                $('.addlabourAddFormErrors').remove();

                $.each(percentArray, function(ky, val) {
                    errors = checkPercentages("#" + val);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(fieldArray, function(ky, val) {
                    errors = checkFields("#" + val);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(integerArray, function(key, value) {
                    errors = checkIntegers("#" + value);
                    if (errors === true) {
                       error_count+=1;
                       
                    }
                });

                $.each(numericArray, function(key, value) {
                    errors = checkNumerics("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                var duplicateValue = $('#' + duplicateCheck).val();
                var url1 = 'ajax_checkForDuplicate';
                var data1 = {};

                data1['value'] = duplicateValue;
                data1['tableName'] = "labour";

                $.ajax({
                    type: 'GET',
                    url: url1,
                    data: data1,
                    async: false,
                    success: function(response) {
                        if (response === "true") {
                            console.log("in here so true");
                            error_count += 1;
                            $('#' + duplicateCheck).after('<div class="addlabourAddFormErrors">&nbspThis Category is already registered.</div>');
                        }
                    }, error: function(jqXHR, textStatus, errorThrown) {
                        window.location.assign('error/index');
                    }
                });

                if (errors === false && error_count === 0) {
                    var data = $(this).serializeArray();
                    var url = $(this).attr('action');


                    $.post(url, data, function(response) {
                        window.location.assign('../labour/index');
                        return false;
                    });

                }

                return false;
            });
            return false;
        }, 'json');
        return false;
    });


    $('#labourFormDelete').click(function(e) {
        e.preventDefault();
        $("#showLabourCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var insertString = "<div id='showLabourCostsFormContainer'><h2>Delete Labour Costs</h2><table id='showLabourCostsTable'>";
        var field = "";
        var thisCurrency = [];
        
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];
                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='" + j + "' id='emptyshowLabourCostsTableTD'><a class='labourDelete' id='" + j + "' href='#' rel='" + response[i + 1][j]['id'] + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                    } else if (response[i] === "employee_category") {
                        insertString += "<th nowrap class='" + j + "' >" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];
                        insertString += "<td class='" + j + "' id='currencyShow'>" + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_allocation/g)) {
                        insertString += "<td class='" + j + "'>" + response[i + 1][j][field] + " %</td>";
                    } else if (response[i].match(/update/g)) {
                        insertString += "<td nowrap class='" + j + "'>" + response[i + 1][j][field] + "</td>";
                    } else {    
                        insertString += "<td class='" + j + "'><span id='currencyShow' class='currency" + j + "'></span> " + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#labourMainMIDMainSectionRHS").append(insertString);
            for (var i = 0; i <= thisCurrency.length; i++) {
                $('.currency' + i).text('' + thisCurrency[i]);
            }

            $(".labourDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');

                $.post('ajax_LabourDelete', {'id': uid}, function(o) {


                }, 'json');
                $("." + colnum).hide();
                return false;
            });
            return false;
        }, 'json');

        return false;
    });


    $('#labourFormModify').click(function(e) {
        e.preventDefault();
        $("#showLabourCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var currentupdater = $('#currentupdater').val();
        var insertString = "<div id='showLabourCostsFormContainer'><h2>Modify Labour Costs</h2><form name='modifyLabour'><table id='showLabourCostsTable'>";
        var field = "";
        var numberArray = [];
        var integerArray = [];
        var fieldArray = [];
        var colNames = [];
        var originalField = [];
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdated" || response[i] === "lastupdatedby") {
                    insertString += "<td id='emptyshowLabourCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {

                    if (response[i] === "id") {
                        insertString += "<td class='" + j + "' id='emptyshowLabourCostsTableTD'><a class='labourModify' id='" + j + "' href='#' rel='" + response[i + 1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "employee_category") {
                        insertString += "<th nowrap class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "'/></th>";
                        fieldArray.push(response[i] + j);
                        var duplicateCheck = response[i];
                        originalField.push(response[i + 1][j][field]);
                    } else if (response[i] === "lastupdated" || response[i] === "lastupdatedby") {
                        insertString += "<td class='" + j + "'id='emptyshowLabourCostsTableTD'></td>";
                    } else if (response[i].match(/_allocation/g)) {
                        insertString += "<td class='" + j + "'><input class='percentage' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='4' /> %</td>";
                        numberArray.push(response[i] + j);
                    } else if (response[i].match(/this_employee/g)) {
                        insertString += "<td class='" + j + "'><input class='percentage' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='8' /></td>";
                        integerArray.push(response[i] + j);
                    } else if (response[i].match(/currency/g)) {
                        insertString += "<td class='" + j + "'><select class='selectCurrency' id='" + response[i] + j + "' name='" + response[i] + "'>";
                        var currentCurrency = response[i + 1][j][field];
                        $.ajax({
                            type: 'GET',
                            url: 'ajax_getCurrency',
                            async: false,
                            dataType: 'json',
                            success: function(response) {

                                for (var i = 0; i < response.length; i += 1) {
                                    if (response[i] === currentCurrency) {
                                        insertString += "<option selected value='" + response[i] + "'>" + response[i] + "</option>";
                                    } else {
                                        insertString += "<option value='" + response[i] + "'>" + response[i] + "</option>";
                                    }
                                }

                            }, error: function(jqXHR, textStatus, errorThrown) {
                                window.location.assign('error/index');
                            }
                        });
                        insertString += "</select></td>";
                    } else if (response[i].match(/employee_type/g)) {
                        var currentEmployeeType = response[i + 1][j][field];
                        var types = ["Non-Performer", "Central Performer","On-Site Performer"];
                        insertString += "<td class='" + j + "'><select class='selectCurrency' id='" + response[i] + j + "' name='" + response[i] + "'>";
                        insertString += "<option selected value='" + currentEmployeeType +"'>" + currentEmployeeType +"</option>";
                        if (currentEmployeeType === "Central Performer") {
                            insertString += "<option value='On-site Performer'>On-site Performer</option><option value='Non-Performer'>Non-Performer</option>";
                        } else if (currentEmployeeType === "On-site Performer"){
                            insertString += "<option value='Central Performer'>Central Performer</option><option value='Non-Performer'>Non-Performer</option>";
                        } else {
                            insertString += "<option value='On-site Performer'>On-site Performer</option><option value='Central Performer'>Central Performer</option>";
                        }
                        insertString += "</select></td>";
                    } else {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='10'/></td>";
                        numberArray.push(response[i] + j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#labourMainMIDMainSectionRHS").append(insertString);

            $(".labourModify").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                var errors = false;
                var error_count = 0;

                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(integerArray, function(key, value) {
                    errors = checkIntegers("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                $.each(fieldArray, function(key, value) {
                    errors = checkFields("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                var duplicateValue = $('#' + duplicateCheck + colnum).val();

                if (originalField[colnum] !== duplicateValue) {
                    var url1 = 'ajax_checkForDuplicate';
                    var data1 = {};

                    data1['value'] = duplicateValue;
                    data1['tableName'] = "labour";

                    $.ajax({
                        type: 'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {
                            if (response === "true") {
                                error_count += 1;
                                $('#' + duplicateCheck + colnum).after('<div class="addlabourAddFormErrors">&nbspThis Data Center is already registered.</div>');
                            }
                        }, error: function(jqXHR, textStatus, errorThrown) {
                            window.location.assign('error/index');
                        }
                    });

                }

                if (errors === false && error_count === 0) {
                    var myjsonforPosting = {};
                    myjsonforPosting["currentupdater"] = currentupdater;
                    $.each(colNames, function(key, value) {
                        if (value !== "id" && value !== "lastupdatedby") {
                            myjsonforPosting['' + value] = $("#" + value + colnum).val();
                        }
                    });
                    myjsonforPosting["id"] = uid;
                    $.post('ajax_LabourModify', myjsonforPosting, function(o) {


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
