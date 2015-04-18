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
                $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter numbers only</div>');
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
                $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter numeric digits only</div>');
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
                $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter numeric digits only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkeMail(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter an eMail Address</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter a valid eMail address</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9.;,:"'_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
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
                $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
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
                $('' + fieldName).after('<div class="addcustomersAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    $('#customersFormShow').click(function() {
        $("#showcustomersCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var insertString = "<div id='showcustomersCostsFormContainer'><h2>Current Customers</h2><table id='showcustomersCostsTable'>";
        var field = "";
        
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowcustomersCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowcustomersCostsTableTD'></td>";
                    } else if (response[i] === "customer_name") {
                        insertString += "<th>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i] === "business_description") {
                        insertString += "<td id='tdbusinessdescription'><textarea class='textarea' cols='30' rows='5'>" + response[i + 1][j][field] + "</textarea></td>";
                    } else {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    }

                }

                insertString += "</tr>";

            }
            insertString += "</table></div>";
            $("#customersMainMIDMainSectionRHS").append(insertString);
            return false;
        }, 'json');

        return false;

    });

    $('#customersFormAdd').click(function(e) {
        e.preventDefault();
        $("#showcustomersCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var lastupdatedby = $('#lastupdatedby').val();     
        var numberArray = [];
        var fieldArray = [];
        var emailArray = [];
        var entriesArray = [];
        var telenumsArray = [];
        var descriptionArray = [];
        var streetnumArray = [];
        
        var tableName = $('#tableName').val();
        var countryArray = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo {Democratic Rep}","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland {Republic}","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar, {Burma}","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russian Federation","Rwanda","St Kitts & Nevis","St Lucia","Saint Vincent & the Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"];
        var insertString = "<div id='showcustomersCostsFormContainer'><h2>Add Customers</h2><form name='customersAddAssets' id='customersFormAddSubmit' action='ajax_customersAdd'><table id='showcustomersCostsTable'>";
        insertString+="<input type='hidden' name='tableName' value='"+tableName+"'><input type='hidden' name='lastupdatedby' value='"+ lastupdatedby +"'>";
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowcustomersCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }
              
                switch (response[i]) {
                    case "id":
                        insertString += "<td id='emptyshowcustomersCostsTableTD'></td>";
                        break;
                    case "lastupdatedby":
                        insertString += "<td id='emptyshowcustomersCostsTableTD'></td>";
                        break;
                    case "lastupdated":
                        insertString += "<td id='emptyshowcustomersCostsTableTD'></td>";
                        break;
                    case "customer_name": 
                        insertString += "<th class='monetaryshowcustomersCostsTableTD'><input id='" + response[i] + "' class='customername' name='" + response[i] + "' maxlength='30'></th>";
                        fieldArray.push(response[i]);
                        var duplicateCheck=response[i];
                        break; 
                    case "street_address_1":
                        insertString += "<td class='monetaryshowcustomersCostsTableTD'><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></td>";
                        fieldArray.push(response[i]);
                        break;
                    case "street_number": 
                        insertString += "<td class='percentageshowcustomersCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='15'></td>";
                        streetnumArray.push(response[i]);
                        break;  
                    case "company_number": case "VAT_number": 
                        insertString += "<td class='percentageshowcustomersCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='15'></td>";
                        numberArray.push(response[i]);
                        break;  
                    case "primary_telephone": case "secondary_telephone": case "fax_telephone":
                        insertString += "<td class='monetaryshowcustomersCostsTableTD'><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></td>";
                        telenumsArray.push(response[i]);
                        break;   
                    case "customer_email": 
                        insertString += "<td class='monetaryshowcustomersCostsTableTD'><input id='" + response[i] + "' class='email' name='" + response[i] + "' maxlength='30'></td>";
                        emailArray.push(response[i]);
                        break; 
                    case "post_code":
                        insertString += "<td class='monetaryshowcustomersCostsTableTD'><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='8'></td>";
                        entriesArray.push(response[i]);
                        break;
                    case "country": 
                        insertString += "<td class='monetaryshowcustomersCostsTableTD'><select name='"+response[i]+"'><option selected value='United Kindom'>United Kingdom</option><option value='Ireland'>Ireland</option>";
                        $.each(countryArray, function(key,value) {
                           insertString+="<option value='"+value+"'>"+value+"</option>";
                        });
                        insertString+="</select></td>";
                        break; 
                    case "business_description": 
                        insertString += "<td><textarea id='" + response[i] + "' name='" + response[i] + "' rows='5' cols='30'></textarea></td>";
                        descriptionArray.push(response[i]);
                        break; 
                    default:
                        insertString += "<td class='monetaryshowcustomersCostsTableTD'><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></td>";
                        entriesArray.push(response[i]);
                        break;
                }
            

                insertString += "</tr>";

            }
            insertString += "</table>";
            insertString += "<p><input class='customersAddInputSubmit' id='customersFormAddButton' type='submit' value='Add Customer'/></p>";
            insertString += "</form></div>";
            $("#customersMainMIDMainSectionRHS").append(insertString);

            $('#customersFormAddSubmit').submit(function(e) {
                e.preventDefault();
                var errors = false;
                var error_count = 0;
                
                $('.addcustomersAddFormErrors').remove();
                
                $.each(numberArray, function(key, value) {
                    errors=checkNumbers("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                });
                
                $.each(streetnumArray, function(key, value) {
                    errors=checkStreetnum("#"+value);   
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
                
                $.each(descriptionArray, function(key, value) {
                    errors=checkDescription("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                });
                
                $.each(entriesArray, function(key, value) {
                    errors = checkEntries("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                $.each(emailArray, function(key, value) {
                    errors=checkeMail("#"+value);   
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
                 
                if ($('#'+duplicateCheck).val() !== "") {
                    var url1 = 'ajax_checkForDuplicate';
                    var data1 = {};

                    data1['value'] = $('#'+duplicateCheck).val();

                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {

                            if (response === "true") {         
                                error_count+=1;
                                $('.customername').after('<div class="addcustomersAddFormErrors">&nbspThis customer is already registered.</div>'); 
                            } 
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                     });  
                }
                
                  
                if (errors === false && error_count === 0) {
                    var data = $(this).serializeArray();
                    var url = $(this).attr('action');
                    $.post(url, data, function() {
                        $('#customersFormAddSubmit')[0].reset();
                        return false;
                    });

                }

                return false;
            });
            return false;
        }, 'json');
        return false;
    });


    $('#customersFormDelete').submit(function(e) {
        e.preventDefault();
        $("#showcustomersCostsFormContainer").remove();
        var data = $(this).serializeArray();
        var tableName = data[0]['value'];
        var url = $(this).attr('action');
        var insertString = "<div id='showcustomersCostsFormContainer'><h2>Delete Customers</h2><table id='showcustomerCostsTable'>";
        var field = "";
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "password") {
                    insertString += "<td id='emptyshowcustomerCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];
                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowcustomerCostsTableTD'><a href='#' rel='" + response[i+1][j]['id'] + "' class='customerDelete' id='"+j+"'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                    } else if (response[i] === "customer_name") {
                        insertString += "<th class='"+j+"'>" + response[i + 1][j][field] + "</th>";
                    } else {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
           
            $("#customersMainMIDMainSectionRHS").append(insertString);
            
            $(".customerDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                
                $.post('ajax_customersDelete', {'id': uid, 'tableName': tableName}, function(o) {
             
                }, 'json');
                $("." + colnum).hide();
                return false;
            });
            return false;
        }, 'json');

        return false;
    });
    
    
    $('#customersFormModify').click(function(e) {
        e.preventDefault();
        $("#showcustomersCostsFormContainer").remove();
        var countryArray = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo {Democratic Rep}","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland {Republic}","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar, {Burma}","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russian Federation","Rwanda","St Kitts & Nevis","St Lucia","Saint Vincent & the Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"];
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var currentupdater = $('#currentupdater').val();   
        var insertString = "<div id='showcustomersCostsFormContainer'><h2>Modify Customers</h2><form name='modifycustomers'><table id='showcustomersCostsTable'>";
        var field = "";
        var tableName = $('#tableName').val();
        var fieldArray=[];
        var emailArray=[];
        var numberArray=[];
        var entriesArray = [];
        var telenumsArray = [];
        var descriptionArray = [];
        var streetnumArray = [];
        var duplicateOriginal=[];
        var duplicateCheck=[];
        var colNames = [];
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdated" || response[i] === "lastupdatedby") {
                    insertString += "<td id='emptyshowcustomersCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];
                
                for (var j = 0; j < response[i + 1].length; j++) {
                    
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowcustomersCostsTableTD'><a class='customersModify' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "customer_name") {
                        insertString += "<th class='"+j+"'><input class='customerInput' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></th>";
                        fieldArray.push(response[i]+j);
                        duplicateOriginal.push(response[i + 1][j][field]);
                        duplicateCheck.push(response[i]+j);
                    } else if (response[i] === "lastupdated" || response[i] === "lastupdatedby") {
                        insertString += "<td class='"+j+"' id='emptyshowcustomersCostsTableTD'></td>";
                    } else if (response[i] === "customer_email") {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></td>";
                        emailArray.push(response[i]+j);
                    } else if (response[i].match(/_description/g)) {
                        insertString += "<td class='"+j+"'><textarea class='textarea' id='" + response[i] + j + "' rows='5' cols='30'>"+ response[i + 1][j][field] +"</textarea></td>";
                        descriptionArray.push(response[i]+j);
                    } else if (response[i].match(/street_number/g)) {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "' maxlength='15'/></td>";
                        streetnumArray.push(response[i]+j);
                    } else if (response[i].match(/number/g)) {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "' maxlength='15'/></td>";
                        numberArray.push(response[i]+j);
                    } else if (response[i] === "primary_telephone" || response[i] === "secondary_telephone" || response[i] === "fax_telephone") {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "' maxlength='15'/></td>";
                        telenumsArray.push(response[i]+j);
                    } else if (response[i] === "country") {
                        insertString += "<td class='"+j+"'><select id='" + response[i] + j +"' name='"+response[i]+"'><option selected value='" + response[i + 1][j][field] + "'>" + response[i + 1][j][field] + "</option><option value='Ireland'>Ireland</option>";
                        $.each(countryArray, function(key,value) {
                           insertString+="<option value='"+value+"'>"+value+"</option>";
                        });
                        insertString+="</select></td>";
                    } else {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></td>";
                        entriesArray.push(response[i]+j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#customersMainMIDMainSectionRHS").append(insertString);
            
            $(".customersModify").click(function(e) {
                e.preventDefault();
                var error_count=0;
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');     
                $('.addcustomersAddFormErrors').remove();

                $.each(numberArray, function(key, value) {
                    errors=checkNumbers("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                });
                
                $.each(streetnumArray, function(key, value) {
                    errors=checkStreetnum("#"+value);   
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
                
                $.each(descriptionArray, function(key, value) {
                    errors=checkDescription("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                });
                
                $.each(entriesArray, function(key, value) {
                    errors = checkEntries("#" + value);
                    if (errors === true) {
                        error_count += 1;
                    }
                });

                $.each(emailArray, function(key, value) {
                    errors=checkeMail("#"+value);   
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

                var duplicateValue = $('#'+duplicateCheck[colnum]).val();
                var url1 = 'ajax_checkForDuplicate';
                var data1 = {};            
                data1['value'] = duplicateValue;
                var duplicate = "false";
                
                if (duplicateValue !== duplicateOriginal[colnum] && error_count===0) {
                    
                    
                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {

                            if (response === "true") { 
                                error_count+=1;
                                $('#customer_name'+colnum).after('<div class="addcustomersAddFormErrors">&nbspThis customer is already registered.</div>'); 
                            } 
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                      });  
                  } else {
                      duplicate=true;
                  }
                    

                if (errors === false && error_count === 0 && duplicate) {
                    var myjsonforPosting = {}; 
                    myjsonforPosting["currentupdater"] = currentupdater;
                        $.each(colNames, function(key, value) {
                            if (value !== "id" && value !== "lastupdatedby") {
                            myjsonforPosting[''+value] = $("#"+value + colnum).val();
                            }
                        });
                    myjsonforPosting["id"] = uid;
                    $.post('ajax_customersModify', myjsonforPosting, function(o) {

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
