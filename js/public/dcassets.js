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

    function checkFloats(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).val('0.00');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addofficesAddFormErrors">&nbspPlease enter decimal numbers only</div>');
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
                $('' + fieldName).after('<div class="addofficesAddFormErrors">&nbspPlease enter integers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    } 
    
    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addofficesAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addofficesAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    

    $('#dcAssetsFormShow').click(function() {
        $("#showdcAssetsCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var insertString = "<div id='showdcAssetsCostsFormContainer'><h2>Current DC Asset Costs</h2><table id='showdcAssetsCostsTable'>";
        var field = "";
        var thisCurrency = [];
        
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowdcAssetsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowdcAssetsCostsTableTD'></td>";
                    } else if (response[i] === "assets_location") {
                        insertString += "<th nowrap>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];                       
                        insertString += "<td class='currencyShow'>"+ response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td><span id='currencyShow' class='currency"+j+"'></span> "+ response[i + 1][j][field] + "</td>";
                    } else {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    }
                }
                
                insertString += "</tr>";

            }
            
            insertString += "</table></div>";
            $("#dcAssetsMainMIDMainSectionRHS").append(insertString);    
            
            for (var i=0; i<=thisCurrency.length;i++) {
                $('.currency'+i).text(''+thisCurrency[i]);
            }
            
            return false;
        }, 'json');
        
        
            
        return false;

    });

    $('#dcAssetsFormAdd').click(function(e) {
        e.preventDefault();
        $("#showdcAssetsCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var lastupdatedby = $('#lastupdatedby').val();     
        var countryArray = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo {Democratic Rep}","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland {Republic}","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar, {Burma}","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russian Federation","Rwanda","St Kitts & Nevis","St Lucia","Saint Vincent & the Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"];
        var fieldArray = [];
        var floatsArray = [];
        var integersArray = [];
        var insertString = "<div id='showdcAssetsCostsFormContainer'><h2>Add DC Assets Costs</h2><form name='dcAssetsAddAssets' id='dcAssetsFormAddSubmit' action='ajax_dcAssetsAdd'><table id='showdcAssetsCostsTable'>";
        insertString+="<input type='hidden' name='tableName' value='dcassets'><input type='hidden' name='lastupdatedby' value='"+ lastupdatedby +"'>";
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowdcAssetsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }
              
                var res = response[i].match(/_qty/g);
                if (res) {
                    insertString += "<td class='percentageshowdcAssetsCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'></td>";
                    integersArray.push(response[i]);
                } else if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowdcAssetsCostsTableTD'></td>";
                } else if (response[i] === "assets_location") {
                    insertString += "<th><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='30'></th>";
                    fieldArray.push(response[i]);
                    var duplicateCheck=response[i];
                } else if (response[i].match(/currency/g)) {
                    insertString += "<td><select class='selectCurrency' id='"+response[i]+ "' name='"+response[i]+"'>";
                    
                    $.ajax({
                    type:'GET',
                    url: 'ajax_getCurrency',
                    async: false,
                    dataType: 'json',
                    success: function(response) {

                            for (var i=0; i<response.length;i+=1){
                                insertString += "<option value='"+response[i]+"'>"+response[i]+"</option>";
                            }

                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                    }); 
                    insertString += "</select></td>";
                } else if (response[i].match(/country/g)) {
                    insertString += "<td class='monetaryshowdcAssetsCostsTableTD'><select name='"+response[i]+"'><option selected value='United Kindom'>United Kingdom</option><option value='Ireland'>Ireland</option>";
                        $.each(countryArray, function(key,value) {
                           insertString+="<option value='"+value+"'>"+value+"</option>";
                        });
                    insertString+="</select></td>";
                } else if (response[i].match(/cost/g)) {
                    insertString += "<td class='monetaryshowdcAssetsCostsTableTD'><span class='currency'></span><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";
                    floatsArray.push(response[i]);
                } else if (response[i].match(/size/g)) {
                    insertString += "<td class='monetaryshowdcAssetsCostsTableTD'><span class='currency'></span><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";
                    floatsArray.push(response[i]);
                } else {
                    insertString += "<td class='monetaryshowdcAssetsCostsTableTD'><span class='currency'></span><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";
                    fieldArray.push(response[i]);
                }

                insertString += "</tr>";

            }
            insertString += "</table>";
            insertString += "<p><input class='dcAssetsAddInputSubmit' id='dcAssetsFormAddButton' type='submit' value='Add DC Assets Costs'/></p>";
            insertString += "</form></div>";
            $("#dcAssetsMainMIDMainSectionRHS").append(insertString);
              
            $('#dcAssetsFormAddSubmit').submit(function(e) {
                e.preventDefault();

                var errors = false;
                var error_count = 0;
                $('.adddcAssetsAddFormErrors').remove();

                $.each(integersArray, function(key, value) {
                    errors=checkIntegers("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                });
                
                $.each(floatsArray, function(key, value) {
                    errors=checkFloats("#"+value);   
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
                
                var duplicateValue = $('#'+duplicateCheck).val();
                var url1 = 'ajax_checkForDuplicate';
                var data1 = {};
                
                data1['value'] = duplicateValue;
                data1['tableName'] = "dcassets";
                
                $.ajax({
                    type:'GET',
                    url: url1,
                    data: data1,
                    async: false,
                    success: function(response) {
                        if (response === "true") {         
                            error_count+=1;
                            $('#assets_location').after('<div class="adddcAssetsAddFormErrors">&nbspThis Data Center is already registered.</div>'); 
                        } 
                    }, error: function(jqXHR, textStatus, errorThrown) {
                     window.location.assign('error/index');
                    }
                  });  
                

                if (errors === false && error_count === 0) {
                    var data = $(this).serializeArray();
                    var url = $(this).attr('action');

                    $.post(url, data, function(response) {
                        $('#dcAssetsFormAddSubmit')[0].reset();
                        return false;
                    }, 'json');

                }

                return false;
            });
            return false;
        }, 'json');
        return false;
    });


    $('#dcAssetsFormDelete').click(function(e) {
        e.preventDefault();
        $("#showdcAssetsCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var insertString = "<div id='showdcAssetsCostsFormContainer'><h2>Delete DC Assets Costs</h2><table id='showdcAssetsCostsTable'>";
        var field = "";
        var thisCurrency = [];
        
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowdcAssetsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];
                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowdcAssetsCostsTableTD'><a class='dcAssetsDelete' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                    } else if (response[i] === "assets_location") {
                        insertString += "<th nowrap class='" + j + "'>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];                       
                        insertString += "<td class='" + j + "' id='currencyShow'>"+ response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td nowrap class='" + j + "'><span id='currencyShow' class='currency"+j+"'></span> "+ response[i + 1][j][field] + "</td>";
                    } else {
                        insertString += "<td nowrap class='" + j + "'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#dcAssetsMainMIDMainSectionRHS").append(insertString);
            for (var i=0; i<=thisCurrency.length;i++) {
                $('.currency'+i).text(''+thisCurrency[i]);
            }
            
            $(".dcAssetsDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                
                $.post('ajax_dcAssetsDelete', {'id': uid}, function(o) {
                    
                }, 'json');
                $("." + colnum).hide();
                return false;
            });
            return false;
        }, 'json');

        return false;
    });
    
    
    $('#dcAssetsFormModify').click(function(e) {
        e.preventDefault();
        $("#showdcAssetsCostsFormContainer").remove();
        var data = $(this).serialize();
        var url = $(this).attr('action');
        var currentupdater = $('#currentupdater').val();   
        var insertString = "<div id='showdcAssetsCostsFormContainer'><h2>Modify DC Assets Costs</h2><form name='modifydcAssets'><table id='showdcAssetsCostsTable'>";
        var field = "";
        var countryArray = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo {Democratic Rep}","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland {Republic}","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar, {Burma}","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russian Federation","Rwanda","St Kitts & Nevis","St Lucia","Saint Vincent & the Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"];
        var fieldArray = [];
        var floatsArray = [];
        var integersArray = [];
        var colNames = [];
        var originalField=[];
       
        $.post(url, data, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowdcAssetsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];
                
                for (var j = 0; j < response[i + 1].length; j++) {
                    
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowdcAssetsCostsTableTD'><a class='dcAssetsModify' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                        insertString += "<td class='"+j+"' id='emptyshowdcAssetsCostsTableTD'></td>";
                    } else if (response[i].match(/location/g)) {
                        insertString += "<th nowrap class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></th>";
                        fieldArray.push(response[i]+j);
                        var duplicateCheck=response[i];
                        originalField.push(response[i + 1][j][field]);
                    } else if (response[i].match(/_qty/g)) {
                        insertString += "<td class='"+j+"'><input id='" + response[i] + j +"' class='percentage' value='" + response[i + 1][j][field] + "' maxlength='6'></td>";
                        integersArray.push(response[i]+j);
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
                } else if (response[i].match(/country/g)) {
                        insertString += "<td class='"+j+"'><select id='" + response[i] + j +"' name='"+response[i]+"'><option selected value='" + response[i + 1][j][field] + "'>" + response[i + 1][j][field] + "</option><option value='Ireland'>Ireland</option>";
                        $.each(countryArray, function(key,value) {
                           insertString+="<option value='"+value+"'>"+value+"</option>";
                        });
                        insertString+="</select></td>";
                } else if (response[i].match(/_cost/g)) {
                    insertString += "<td class='"+j+"'><span class='currency'></span><input id='" + response[i] + j +"' class='monetary' value='" + response[i + 1][j][field] + "' maxlength='14'></td>";
                    floatsArray.push(response[i]+j);
                } else if (response[i].match(/size/g)) {
                    insertString += "<td class='"+j+"'><span class='currency'></span><input id='" + response[i] + j +"' class='monetary' value='" + response[i + 1][j][field] + "' maxlength='14'></td>";
                    floatsArray.push(response[i]+j);
                } else {
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></td>";
                        numberArray.push(response[i]+j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#dcAssetsMainMIDMainSectionRHS").append(insertString);
            
            $(".dcAssetsModify").click(function(e) {
                e.preventDefault();
                $('.adddcAssetsAddFormErrors').remove();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');   
                var errors = false;
                var error_count=0;
                
                $.each(integersArray, function(key, value) {
                    errors=checkIntegers("#"+value);   
                    if (errors === true) {
                        error_count+=1;
                    }
                });
                
                $.each(floatsArray, function(key, value) {
                    errors=checkFloats("#"+value);   
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
                if (originalField[colnum] !== duplicateValue) {
                    var url1 = 'ajax_checkForDuplicate';
                    var data1 = {};

                    data1['value'] = duplicateValue;
                    data1['tableName'] = "dcassets";

                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {
                            if (response === "true") {         
                                error_count+=1;
                                $('#'+duplicateCheck+colnum).after('<div class="adddcAssetsAddFormErrors">&nbspThis Data Center is already registered.</div>'); 
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
                            myjsonforPosting[''+value] = $("#"+value + colnum).val();
                            }
                        });
                    myjsonforPosting["id"] = uid;
                    $.post('ajax_dcAssetsModify', myjsonforPosting, function(o) {

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
