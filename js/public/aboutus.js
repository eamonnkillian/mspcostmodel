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
                $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter numbers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkStreetnum(fieldName) {
        if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkNumbers(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).val('000000');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkeMail(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter an eMail Address</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter a valid eMail address</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9.;,:"'_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkDescription(fieldName) {
        if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9.;,:"'_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkEntries(fieldName) {
        if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addaboutusAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    $('#aboutusFormShow').click(function() {
        $("#showaboutusCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var insertString = "<div id='showaboutusCostsFormContainer'><h2>Our Current Details</h2><table id='showaboutusCostsTable'>";
        var field = "";

        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                    } else if (response[i] === "aboutus_name") {
                        insertString += "<th>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i] === "business_description") {
                        insertString += "<td id='tdbusinessdescription'><textarea readonly class='textarea' cols='30' rows='5'>" + response[i + 1][j][field] + "</textarea></td>";
                    } else {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    }

                }

                insertString += "</tr>";

            }
            insertString += "</table></div>";
            $("#aboutusMainMIDMainSectionRHS").append(insertString);
            return false;
        }, 'json');

        return false;

    });

    $('#aboutusFormAdd').click(function(e) {
        e.preventDefault();
        $("#showaboutusCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var lastupdatedby = $('#lastupdatedby').val();
        var numberArray = [];
        var fieldArray = [];
        var emailArray = [];
        var telenumsArray = [];
        var streetnumsArray = [];
        var entriesArray = [];
        var descriptionArray = [];
        var tableName = $('#tableName').val();
        var countryArray = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua & Deps", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Rep", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Congo {Democratic Rep}", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland {Republic}", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea North", "Korea South", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar, {Burma}", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russian Federation", "Rwanda", "St Kitts & Nevis", "St Lucia", "Saint Vincent & the Grenadines", "Samoa", "San Marino", "Sao Tome & Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"];
        var insertString = "<div id='showaboutusCostsFormContainer'><h2>Add Our Details</h2><form name='aboutusAddAssets' id='aboutusFormAddSubmit' action='ajax_aboutusAdd'><table id='showaboutusCostsTable'>";
        insertString += "<input type='hidden' name='tableName' value='" + tableName + "'><input type='hidden' name='lastupdatedby' value='" + lastupdatedby + "'>";
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                switch (response[i]) {
                    case "id":
                        insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                        break;
                    case "lastupdatedby":
                        insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                        break;
                    case "lastupdated":
                        insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                        break;
                    case "our_name":
                        insertString += "<th class='monetaryshowaboutusCostsTableTD'><input id='" + response[i] + "' class='aboutusname' name='" + response[i] + "' maxlength='30'></th>";
                        fieldArray.push(response[i]);
                        var duplicateCheck = response[i];
                        break;
                    case "street_address_1":
                        insertString += "<td class='monetaryshowaboutusCostsTableTD'><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></td>";
                        fieldArray.push(response[i]);
                        break;
                    case "street_number":
                        insertString += "<td class='percentageshowaboutusCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='15'></td>";
                        streetnumsArray.push(response[i]);
                        break;
                    case "company_number":
                    case "VAT_number":
                        insertString += "<td class='percentageshowaboutusCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='15'></td>";
                        numberArray.push(response[i]);
                        break;
                    case "primary_telephone":
                    case "secondary_telephone":
                    case "fax_number":
                        insertString += "<td class='monetaryshowaboutusCostsTableTD'><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></td>";
                        telenumsArray.push(response[i]);
                        break;
                    case "our_email":
                        insertString += "<td class='monetaryshowaboutusCostsTableTD'><input id='" + response[i] + "' class='email' name='" + response[i] + "' maxlength='30'></td>";
                        emailArray.push(response[i]);
                        break;
                    case "country":
                        insertString += "<td class='monetaryshowaboutusCostsTableTD'><select name='" + response[i] + "'><option selected value='United Kindom'>United Kingdom</option><option value='Ireland'>Ireland</option>";
                        $.each(countryArray, function(key, value) {
                            insertString += "<option value='" + value + "'>" + value + "</option>";
                        });
                        insertString += "</select></td>";
                        break;
                    case "currency":
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
                    case "business_description":
                        insertString += "<td><textarea id='" + response[i] + "' name='" + response[i] + "' rows='5' cols='30'></textarea></td>";
                        descriptionArray.push(response[i]);
                        break;
                    default:
                        insertString += "<td class='monetaryshowaboutusCostsTableTD'><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></td>";
                        entriesArray.push(response[i]);
                        break;
                }


                insertString += "</tr>";

            }
            insertString += "</table>";
            insertString += "<p><input class='aboutusAddInputSubmit' id='aboutusFormAddButton' type='submit' value='Add Us'/></p>";
            insertString += "</form></div>";
            $("#aboutusMainMIDMainSectionRHS").append(insertString);

            $('#aboutusFormAddSubmit').submit(function(e) {
                e.preventDefault();
                var errors = false;
                var error_count = 0;

                $('.addaboutusAddFormErrors').remove();

                if ($('#aboutus_name').val() === "") {
                    $('#aboutus_name').after('<div class="addaboutusAddFormErrors">&nbspThe Category cannot be empty</div>');
                    errors = true;
                }
                
                $.each(descriptionArray, function(key, value) {
                    errors = checkDescription("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(streetnumsArray, function(key, value) {
                    errors = checkStreetnum("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(telenumsArray, function(key, value) {
                    errors = checkTelenums("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(entriesArray, function(key, value) {
                    errors = checkEntries("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                $.each(emailArray, function(key, value) {
                    errors = checkeMail("#" + value);
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

                if ($('#' + duplicateCheck).val() !== "") {
                    var url1 = 'ajax_checkForDuplicate';
                    var data1 = {};

                    data1['value'] = $('#' + duplicateCheck).val();

                    $.ajax({
                        type: 'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {

                            if (response === "true") {
                                error_count += 1;
                                $('.aboutusname').after('<div class="addaboutusAddFormErrors">&nbspThis aboutus is already registered.</div>');
                            }
                        }, error: function(jqXHR, textStatus, errorThrown) {
                            window.location.assign('error/index');
                        }
                    });
                }


                if (errors === false && error_count === 0) {
                    var data = $(this).serializeArray();
                    var url = $(this).attr('action');
                    $.post(url, data, function(res) {
                        $('#aboutusFormAddSubmit')[0].reset();
                    }, 'json');
                    $('#aboutusFormAddSubmit')[0].reset();
                }

                return false;
            });
            return false;
        }, 'json');
        return false;
    });


    $('#aboutusFormDelete').submit(function(e) {
        e.preventDefault();
        $("#showaboutusCostsFormContainer").remove();
        var data = $(this).serializeArray();
        var tableName = data[0]['value'];
        var url = $(this).attr('action');
        var insertString = "<div id='showaboutusCostsFormContainer'><h2>Delete Our Details</h2><table id='showaboutusCostsTable'>";
        var field = "";
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "password") {
                    insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];
                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='" + j + "' id='emptyshowaboutusCostsTableTD'><a href='#' rel='" + response[i + 1][j]['id'] + "' class='aboutusDelete' id='" + j + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                    } else if (response[i] === "aboutus_name") {
                        insertString += "<th class='" + j + "'>" + response[i + 1][j][field] + "</th>";
                    } else {
                        insertString += "<td class='" + j + "'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";

            $("#aboutusMainMIDMainSectionRHS").append(insertString);

            $(".aboutusDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');

                $.post('ajax_aboutusDelete', {'id': uid, 'tableName': tableName}, function(o) {

                }, 'json');
                $("." + colnum).hide();
                return false;
            });
            return false;
        }, 'json');

        return false;
    });


    $('#aboutusFormModify').click(function(e) {
        e.preventDefault();
        $("#showaboutusCostsFormContainer").remove();
        var countryArray = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua & Deps", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Rep", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Congo {Democratic Rep}", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland {Republic}", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea North", "Korea South", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar, {Burma}", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russian Federation", "Rwanda", "St Kitts & Nevis", "St Lucia", "Saint Vincent & the Grenadines", "Samoa", "San Marino", "Sao Tome & Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"];
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var currentupdater = $('#currentupdater').val();
        var insertString = "<div id='showaboutusCostsFormContainer'><h2>Modify Our Details</h2><form name='modifyaboutus'><table id='showaboutusCostsTable'>";
        var field = "";
        var error_count = 0;
        var tableName = $('#tableName').val();
        var fieldArray = [];
        var emailArray = [];
        var numberArray = [];
        var entriesArray = [];
        var telenumsArray =[];
        var streetnumsArray = [];
        var descriptionArray = [];
        var duplicateOriginal = [];
        var duplicateCheck = [];
        var colNames = [];
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdated" || response[i] === "lastupdatedby") {
                    insertString += "<td id='emptyshowaboutusCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {

                    if (response[i] === "id") {
                        insertString += "<td class='" + j + "' id='emptyshowaboutusCostsTableTD'><a class='aboutusModify' id='" + j + "' href='#' rel='" + response[i + 1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "our_name") {
                        insertString += "<th class='" + j + "'><input class='aboutusInput' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "'/></th>";
                        fieldArray.push(response[i] + j);
                        duplicateOriginal.push(response[i + 1][j][field]);
                        duplicateCheck.push(response[i] + j);
                    } else if (response[i] === "lastupdated" || response[i] === "lastupdatedby") {
                        insertString += "<td class='" + j + "' id='emptyshowaboutusCostsTableTD'></td>";
                    } else if (response[i] === "our_email") {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "'/></td>";
                        emailArray.push(response[i] + j);
                    } else if (response[i].match(/_description/g)) {
                        insertString += "<td class='" + j + "'><textarea class='textarea' id='" + response[i] + j + "' rows='5' cols='30'>" + response[i + 1][j][field] + "</textarea></td>";
                        descriptionArray.push(response[i] + j);
                    } else if (response[i].match(/currency/g)) {
                        insertString += "<td class='"+j+"'><select class='selectCurrency' id='"+response[i]+j+ "' name='"+response[i]+"'>";
                        var currentCurrency = response[i + 1][j][field];
                        $.ajax({
                        type:'GET',
                        url: 'ajax_getCurrency',
                        async: false,
                        dataType: 'json',
                        success: function(response) {

                                for (var i=0; i<response.length;i+=1){
                                    if (response[i] === currentCurrency) {
                                        insertString += "<option selected value='"+response[i]+"'>"+response[i]+"</option>";
                                    } else {
                                        insertString += "<option value='"+response[i]+"'>"+response[i]+"</option>";
                                    }
                                }

                            }, error: function(jqXHR, textStatus, errorThrown) {
                             window.location.assign('error/index');
                            }
                        }); 
                        insertString += "</select></td>";
                    } else if (response[i] === "street_number") {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='15'/></td>";
                        streetnumsArray.push(response[i] + j);
                    } else if (response[i] === "company_number" || response[i] === "VAT_number" ) {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='15'/></td>";
                        numberArray.push(response[i] + j);
                    } else if (response[i] === "over_subscription_ratio") {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='15'/></td>";
                        numberArray.push(response[i] + j);
                    } else if (response[i] === "primary_telephone" || response[i] === "secondary_telephone" || response[i] === "fax_number") {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='15'/></td>";
                        telenumsArray.push(response[i] + j);
                    } else if (response[i] === "country") {
                        insertString += "<td class='" + j + "'><select id='" + response[i] + j + "' name='" + response[i] + "'><option selected value='" + response[i + 1][j][field] + "'>" + response[i + 1][j][field] + "</option><option value='Ireland'>Ireland</option>";
                        $.each(countryArray, function(key, value) {
                            insertString += "<option value='" + value + "'>" + value + "</option>";
                        });
                        insertString += "</select></td>";
                    } else if (response[i].match(/street_address_1/)) {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "'/></td>";
                        fieldArray.push(response[i] + j);
                    } else {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "'/></td>";
                        entriesArray.push(response[i] + j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#aboutusMainMIDMainSectionRHS").append(insertString);

            $(".aboutusModify").click(function(e) {
                e.preventDefault();
                var error_count = 0;
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                $('.addaboutusAddFormErrors').remove();
                
                $.each(descriptionArray, function(key, value) {
                    errors = checkDescription("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(streetnumsArray, function(key, value) {
                    errors = checkStreetnum("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(telenumsArray, function(key, value) {
                    errors = checkTelenums("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });
                
                $.each(entriesArray, function(key, value) {
                    errors = checkEntries("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                $.each(emailArray, function(key, value) {
                    errors = checkeMail("#" + value);
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

                var duplicateValue = $('#' + duplicateCheck[colnum]).val();
                var url1 = 'ajax_checkForDuplicate';
                var data1 = {};
                data1['value'] = duplicateValue;
                var duplicate = "false";

                if (duplicateValue !== duplicateOriginal[colnum] && error_count === 0) {


                    $.ajax({
                        type: 'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {

                            if (response === "true") {
                                error_count += 1;
                                $('#aboutus_name' + colnum).after('<div class="addaboutusAddFormErrors">&nbspThis aboutus is already registered.</div>');
                            }
                        }, error: function(jqXHR, textStatus, errorThrown) {
                            window.location.assign('error/index');
                        }
                    });
                } else {
                    duplicate = true;
                }


                if (errors === false && error_count === 0 && duplicate) {
                    var myjsonforPosting = {};
                    myjsonforPosting["currentupdater"] = currentupdater;
                    $.each(colNames, function(key, value) {
                        if (value !== "id" && value !== "lastupdatedby") {
                            myjsonforPosting['' + value] = $("#" + value + colnum).val();
                        }
                    });
                    myjsonforPosting["id"] = uid;
                    $.post('ajax_aboutusModify', myjsonforPosting, function(o) {

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
