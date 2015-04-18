/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the Our Product Catalogue Management function within the application. 
 */

$(function() {
    
    $('#ourproductsSelect').change(function() {
        $("#showourproductsCostsFormContainer").remove();
        $("#ourproductsMenu").hide();
        var value=$('#ourproductsSelect').val();
        $('#tableName').val(value);
        value = value.replace(/_/g, " ");
        if (value === "paas service products") {
            value = "PaaS Services";
        } else if (value === "saas service products") {
            value = "SaaS Sevices";
        } else if (value === "byod service products") {
            value = "BYOD Services";
        } else if (value === "voip services") {
            value = "VOIP Services";
        } else if (value === "iaas virtual nas products") {
            value = "Iaas Virtual NAS Products";
        } else if (value === "iaas virtual san products") {
            value = "Iaas Virtual SAN Products";
        } else if (value === "iaas physical nas products") {
            value = "Iaas Physical NAS Products";
        } else if (value === "iaas physical san products") {
            value = "Iaas Physical SAN Products";
        } else {
            value = toTitleCase(value);
        }
        
        var count = 0;
        var choicesArray=["Show","Add","Modify","Delete"];
        $.each(choicesArray, function(key, val) {
            $('#ourproductsMenuChoice'+val).val(val+" "+value);
            count++;
            });
        $("#ourproductsMenu").show();
    });

    function toTitleCase(str)
    {
        // Many thanks to Greg Dean http://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
        return str.replace(/\w\S*/g, function(txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    }
    
    function checkDescription(fieldName) {
        if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9.;,:"'_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addourproductsAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }
    
    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addourproductsAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addourproductsAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkNumbers(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).val('0.00');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^\d*(\.\d{1})?\d{0,1}$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addourproductsAddFormErrors">&nbspPlease enter monetary amounts only</div>');
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
                $('' + fieldName).after('<div class="addourproductsAddFormErrors">&nbspPlease enter integers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    } 
    

    $('#ourproductsMenuChoiceShow').click(function(){
        $("#showourproductsCostsFormContainer").remove();
        var url = $('#ourproductsFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        //tableName = toTitleCase(tableName);
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var insertString = "<div id='showourproductsCostsFormContainer'><h2>Current "+ table_Name +"</h2><table id='showourproductsCostsTable'>";
        var field = "";
        var thisCurrency = [];
        
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowourproductsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowourproductsCostsTableTD'></td>";
                    } else if (response[i].match(/_name/g)) {
                        insertString += "<th nowrap>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td><span class='currency"+j+"' id='currencyShow'></span> "+ response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_consumption/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + " KWH pa</td>";
                    } else if (response[i].match(/bandwidth/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + " Mbps</td>";
                    } else if (response[i].match(/description/g)) {
                        insertString += "<td><textarea readonly class='textarea' cols='30' rows='5'>" + response[i + 1][j][field] + "</textarea></td>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];  
                        insertString += "<td id='currencyShow'>" + response[i + 1][j][field] + "</td>";
                    } else {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#ourproductsMainMIDMainSectionRHS").append(insertString);
            for (var i=0; i<=thisCurrency.length;i++) {
                $('.currency'+i).text(''+thisCurrency[i]);
            }
            return false;
            
        }, 'json');
        return false;

    });
       
    $('#ourproductsMenuChoiceAdd').click(function(){
       $("#showourproductsCostsFormContainer").remove();
       var url = $('#ourproductsFormDelete').attr('action');
       var lastupdatedby=$('#lastupdatedby').val();
       var myjsonforPosting = {};
       myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
       var tableName1 = $('#tableName').val().toLowerCase();
       var tableName = toTitleCase(tableName1);
       var table_Name=tableName.replace(/_/g, " ");
       table_Name = toTitleCase(table_Name);
       var integersArray = [];
       var numberArray = [];
       var descriptionArray = [];
       var fieldArray = [];
       var insertString = "<div id='showourproductsCostsFormContainer'><h2>Add "+ table_Name +" Products</h2><form name='ourproductsAddAssets' id='ourproductsFormAddSubmit' action='ajax_ourproductsAdd' method='post'><table id='showourproductsCostsTable'>";
       insertString+="<input type='hidden' name='tableName' value='"+tableName1+"'><input type='hidden' name='lastupdatedby' value='"+ lastupdatedby +"'>"; 
       $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowourproductsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }
                
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowourproductsCostsTableTD'></td>";
                } else if (response[i].match(/description/g)) {  
                    insertString += "<td><textarea id='" + response[i] + "' name='" + response[i] + "' rows='5' cols='30'></textarea></td>";
                    descriptionArray.push(response[i]);
                } else if (response[i].match(/_name/g)) {
                    insertString += "<th><input id='" + response[i] + "' class='alphanumerictype' name='" + response[i] + "' maxlength='30'></th>";
                    fieldArray.push(response[i]);
                    var duplicateCheck = response[i];
                } else if (response[i].match(/_source/g)) {
                    insertString += "<td nowrap><select id='" + response[i] + "' name='" + response[i] + "'>";
                    insertString += "<option value='Internal_Infrastructure' selected>Internal Infrastructure</option>";
                    insertString += "<option value='External_Provider'>Cloud Provider</option></select></td>";
                } else if (response[i].match(/bandwidth/g)) {
                    insertString += "<td class='percentageshowourproductsCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'> Mbps</td>";     
                    integersArray.push(response[i]);
                } else if (response[i].match(/amount/g)) {
                    insertString += "<td class='percentageshowourproductsCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'></td>";     
                    integersArray.push(response[i]);
                } 

                insertString += "</tr>";
            }
            insertString += "</table>";
            insertString += "<p><input type='submit' class='ourproductsAddInputSubmit' id='ourproductsFormAddButton' value='Add "+table_Name+"'/></p>";
            insertString += "</form></div>"; 
        
        $("#ourproductsMainMIDMainSectionRHS").append(insertString);
        
        $('#ourproductsFormAddSubmit').submit(function(e) {
            
                e.preventDefault();

                var errors = false;
                var error_count = 0;
                $('.addourproductsAddFormErrors').remove();
                
                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
                    if (errors === true) {
                       error_count+=1;
                       
                    }
                });
                
                $.each(descriptionArray, function(key, value) {
                    errors = checkDescription("#" + value);
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
                
                $.each(integersArray, function(key, value) {
                    errors = checkIntegers("#" + value);
                    if (errors === true) {
                       error_count+=1;
                       
                    }
                });
                                
                var duplicateValue = $('#'+duplicateCheck).val();
                var url1 = 'ajax_checkForDuplicate';
                var duplicate = true;
                var data1 = {};
                data1['tableName'] = tableName1;
                data1['entry'] = duplicateCheck;
                data1['value'] = duplicateValue;
                
                $.ajax({
                    type:'GET',
                    url: url1,
                    data: data1,
                    async: false,
                    success: function(response) {
                    
                        if (response === "true") {         
                            error_count+=1;
                            $('.alphanumerictype').after('<div class="addourproductsAddFormErrors">&nbspThis '+ tableName +' type is already registered.</div>'); 
                            $('.selectLocation').after('<div class="addourproductsAddFormErrors">&nbspAt this location.</div>'); 
                        } else {
                            duplicate = false;
                        }
                    }, error: function(jqXHR, textStatus, errorThrown) {
                     window.location.assign('error/index');
                    }
                  });     
                
                if (errors === false && error_count === 0 && duplicate===false) {
                        
                    var data = $(this).serializeArray();
                    var url = $(this).attr('action'); 
                    
                    $.ajax({
                        type:'POST',
                        url: url,
                        data: data,
                        async: false,
                        success: function(response) {       
                            if (response === "done") {       
                               $('#ourproductsFormAddSubmit')[0].reset();
                               return false;
                            } 
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                      });
                }
                return false;
            });
            
        },'json');
        return false;
    });
    
    
    $('#ourproductsMenuChoiceModify').click(function(e){
        e.preventDefault();
        $("#showourproductsCostsFormContainer").remove();
        var url = $('#ourproductsFormDelete').attr('action');
        var lastupdatedby=$('#lastupdatedby').val();
        var myjsonforPosting = {};
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var tableName1 = $('#tableName').val().toLowerCase();
        var tableName = toTitleCase(tableName1);
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        var currentupdater = $('#lastupdatedby').val();  
        var insertString = "<div id='showourproductsCostsFormContainer'><h2>Modify "+table_Name+" Products</h2><form name='modifyNetwork'><table id='showourproductsCostsTable'>";
        var field = "";
        var numberArray=[];
        var colNames = [];
        var integersArray = [];
        var fieldArray = [];
        var descriptionArray = [];
        var duplicateType=[];
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowourproductsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];
                
                for (var j = 0; j < response[i + 1].length; j++) {
                    
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowourproductsCostsTableTD'><a class='ourproductsModify' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                        insertString += "<td class='"+j+"' id='emptyshowourproductsCostsTableTD'></td>";
                    } else if (response[i].match(/_name/g)) {
                        insertString += "<th class='"+j+"'><input class='alphanumeric' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "' 'maxlength='30'/></th>";
                        fieldArray.push(response[i]+j);
                        var duplicateCheck = response[i];
                        var duplicateCheckField = response[i];
                        duplicateType.push(response[i + 1][j][field]);
                    } else if (response[i].match(/bandwidth/g)){
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "' maxlength='6' size='8'/> Mbps</td>";
                        integersArray.push(response[i]+j);
                    } else if (response[i].match(/amount/g)){
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "' maxlength='6' size='8'/></td>";
                        integersArray.push(response[i]+j);
                    } else if (response[i].match(/_source/g)) {
                        insertString += "<td nowrap class='"+j+"'><select id='" + response[i] + j + "' name='" + response[i] + j + "'>";
                        var checkCurrent = response[i + 1][j][field];
                        $.ajax({
                        type:'GET',
                        url: 'ajax_getInternalorExternal',
                        async: false,
                        dataType: 'json',
                        success: function(response1) {
                                for (var i=0; i<response1.length;i+=1){
                                    if (response1[i] === checkCurrent) {
                                        insertString += "<option value='"+response1[i]+"' selected>"+response1[i]+"</option>";
                                    } else {
                                        insertString += "<option value='"+response1[i]+"'>"+response1[i]+"</option>";
                                    }
                                }

                            }, error: function(jqXHR, textStatus, errorThrown) {
                             window.location.assign('error/index');
                            }
                        }); 
                        insertString += "</select></td>";
                    } else if (response[i].match(/description/g)) {
                        insertString += "<td class='" + j + "'><textarea class='textarea' id='" + response[i] + j + "' rows='5' cols='30'>" + response[i + 1][j][field] + "</textarea></td>";
                        descriptionArray.push(response[i] + j);
                    } else {
                        insertString += "<td class='"+j+"'><input id='" + response[i]+j + "' class='inputModify' value='" + response[i+1][j][field] + "' maxlength='14'></td>";
                        numberArray.push(response[i]+j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#ourproductsMainMIDMainSectionRHS").append(insertString);
            
            $(".ourproductsModify").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');   
                var errors = false;
                var error_count=0;
                
                $('.addourproductsAddFormErrors').remove();

                if ($('.alphanumerictype').val() === "") {
                    $('.alphanumerictype').after('<div class="addourproductsAddFormErrors">&nbspThis Category cannot be empty</div>');
                    errors = true;
                    error_count+=1;
                }
                
                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
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
                
                $.each(integersArray, function(key, value) {
                    errors = checkIntegers("#" + value);
                    if (errors === true) {
                       error_count+=1;
                       
                    }
                });
                
                var duplicateValue = $('#'+duplicateCheck+colnum).val();
                var url1 = 'ajax_checkForDuplicate';
                var data1 = {};
                data1['tableName'] = tableName1;
                data1['entry'] = duplicateCheckField;
                data1['value'] = $.trim(duplicateValue);
                
                if (duplicateType[colnum] !== duplicateValue) {
                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {       
                            if (response === "true") {         
                                error_count+=1;
                                $('#'+tableName1+'_type'+colnum).after('<div class="addourproductsAddFormErrors">&nbspAt this location.</div>'); 
                                $('#'+tableName1+'_type'+colnum).after('<div class="addourproductsAddFormErrors">&nbspThis '+ tableName +' type is already registered.</div>'); 
                            } else {
                                duplicate = false;
                            }
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                      });     
                  
                } 
                
                if (errors === false && error_count === 0) {
                    var myjsonforPosting = {}; 
                    myjsonforPosting["currentupdater"] = currentupdater;
                    myjsonforPosting["tableName"] = tableName1;
                        $.each(colNames, function(key, value) {
                            if (value !== "id" && value !== "lastupdatedby") {
                            myjsonforPosting[''+value] = $("#"+value + colnum).val();
                            }
                        });
                    myjsonforPosting["id"] = uid;
                    $.ajax({
                        type:'POST',
                        url: 'ajax_ourproductsModify',
                        data: myjsonforPosting,
                        async: false,
                        success: function(response) {       
                            if (response === "done") {  
                               $("." + colnum).hide();
                               return false;
                            } 
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                      });
                }
                return false;
            });
        
            return false;
        }, 'json');
    });
    
    
    $('#ourproductsMenuChoiceDelete').click(function(){
        $("#showourproductsCostsFormContainer").remove();
        var url = $('#ourproductsFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        tableName = toTitleCase(tableName);
        var tableName1 = $('#tableName').val();
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var insertString = "<div id='showourproductsCostsFormContainer'><h2>Current "+ table_Name +" Assets</h2><table id='showourproductsCostsTable'>";
        var field = "";
        var thisCurrency = [];
        
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowourproductsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowourproductsCostsTableTD'><a class='ourproductsDelete' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";;
                    } else if (response[i].match(/_type/g)) {
                        insertString += "<th nowrap class='"+j+"'>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td class='"+j+"'><span class='currency"+j+"' id='currencyShow'></span> "+ response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_consumption/g)) {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + " KWH pa</td>";
                    } else if (response[i].match(/_rack_size/g)) {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + " u</td>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];  
                        insertString += "<td id='currencyShow' class='"+j+"'>" + response[i + 1][j][field] + "</td>";
                    } else {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#ourproductsMainMIDMainSectionRHS").append(insertString);
            for (var i=0; i<=thisCurrency.length;i++) {
                $('.currency'+i).text(''+thisCurrency[i]);
            }
            
            $(".ourproductsDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                
                $.post('ajax_ourproductsDelete', {'id': uid, 'tableName':tableName1}, function(o) {
                    
                    
                }, 'json');
                $("." + colnum).hide();
                return false;
            });
            return false;
        }, 'json');
        return false;

    });

    return false;
});
