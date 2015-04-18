/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the Data Center Assets Cost Management function within the application. 
 */

$(function() {
    
    $('#storageSelect').change(function() {
        $("#showstorageCostsFormContainer").remove();
        $("#storageMenu").hide();
        var value=$('#storageSelect').val();        
        $('#tableName').val(value);
        var count = 0;
        var choicesArray=["Show","Add","Modify","Delete"];
        $.each(choicesArray, function(key, val) {
            value = value.replace(/_/g, " ");
            value = toTitleCase(value);
            $('#storageMenuChoice'+val).val(val+" "+value);
            count++;
            });
        $("#storageMenu").show();
    });

    function toTitleCase(str)
    {
        // Many thanks to Greg Dean http://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
        return str.replace(/\w\S*/g, function(txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    }
    
    function checkFields(fieldName) {
        console.log(fieldName);
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addstorageAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addstorageAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
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
                $('' + fieldName).after('<div class="addstorageAddFormErrors">&nbspPlease enter monetary amounts only</div>');
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
                $('' + fieldName).after('<div class="addstorageAddFormErrors">&nbspPlease enter integers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    } 

    $('#storageMenuChoiceShow').click(function(){
        $("#showstorageCostsFormContainer").remove();
        var url = $('#storageFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var insertString = "<div id='showstorageCostsFormContainer'><h2>Current "+ table_Name +" Assets</h2><table id='showstorageCostsTable'>";
        var field = "";
        var thisCurrency = [];
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowstorageCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowstorageCostsTableTD'></td>";
                    } else if (response[i].match(/_type/g)) {
                        insertString += "<th>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];                       
                        insertString += "<td class='currencyShow'>"+ response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td><span class='currency"+j+"' id='currencyShow'></span> " + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_consumption/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + " KWH pa</td>";
                    } else if (response[i].match(/_rack_size/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + " u</td>";
                    } else if (response[i].match(/_description/g)) {
                        insertString += "<td><textarea cols='35' rows='5'>" + response[i + 1][j][field] + "</textarea></td>";
                    } else {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#storageMainMIDMainSectionRHS").append(insertString);
            for (var i=0; i<=thisCurrency.length;i++) {
                $('.currency'+i).text(''+thisCurrency[i]);
            }
            return false;
        }, 'json');
        return false;

    });
       
    $('#storageMenuChoiceAdd').click(function(){
       $("#showstorageCostsFormContainer").remove();
       var url = $('#storageFormDelete').attr('action');
       var lastupdatedby=$('#lastupdatedby').val();
       var myjsonforPosting = {};
       myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
       var tableName1 = $('#tableName').val().toLowerCase();
       var tableName = toTitleCase(tableName1);
       var table_Name=tableName.replace(/_/g, " ");
       table_Name = toTitleCase(table_Name);
       
       var numberArray = [];
       var integersArray = [];
       var fieldArray = [];
       var insertString = "<div id='showstorageCostsFormContainer'><h2>Add "+ table_Name +" Assets</h2><form name='storageAddAssets' id='storageFormAddSubmit' action='ajax_storageAdd' method='post'><table id='showstorageCostsTable'>";
       insertString+="<input type='hidden' name='tableName' value='"+tableName1+"'><input type='hidden' name='lastupdatedby' value='"+ lastupdatedby +"'>"; 
       $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowstorageCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }
                
                if (response[i].match(/memory/g) || response[i].match(/_qty/g) || response[i].match(/_capacity/g) || response[i].match(/_size/g) || response[i].match(/_ports/g) || response[i].match(/_term/g) || response[i].match(/_lifespan/g)) {
                    insertString += "<td class='percentageshowstorageCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'></td>";     
                    integersArray.push(response[i]);
                } else if (response[i].match(/_purchase_date/g)) {                    
                    insertString += "<td><script type='text/javascript'> $(function() {$('#datepicker').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='dateType' type='text' name='" + response[i] + "' id='datepicker' value='01/01/2014'></td>";
                } else if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowstorageCostsTableTD'></td>";
                } else if (response[i].match(/assignment/g)) {
                        insertString += "<td><select class='selectCurrency' id='"+response[i]+"' name='"+response[i]+"'>";
                        
                        $.ajax({
                        type:'GET',
                        url: 'ajax_getAssignment',
                        async: false,
                        dataType: 'json',
                        success: function(response1) {
                                for (var i=0; i<response1.length;i+=1){
                                    if (response1[i] === "Production") {
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
                  } else if (response[i].match(/_location/g)) {
                    insertString += "<td><select class='selectLocation' id='"+response[i]+ "' name='"+response[i]+"'>";
                    
                    $.ajax({
                    type:'GET',
                    url: 'ajax_getLocation',
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
                    
                   
                   var locationCheck = response[i];
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
                } else if (response[i].match(/_type/g)) {
                    insertString += "<th><input id='" + response[i] + "' class='alphanumerictype' name='" + response[i] + "' maxlength='30'></th>";
                    fieldArray.push(response[i]);
                    var duplicateCheck = response[i];
                } else if (response[i].match(/_description/g)) {                    
                    insertString += "<td><textarea class='textareaInput' id='" + response[i] + "' name='" + response[i] + "' rows='5' cols='30'></textarea></td>";
                } else if (response[i].match(/_name/g)) {                    
                    insertString += "<td><input id='" + response[i] + "' class='alphanumeric' name='" + response[i] + "' maxlength='60'></td>";  
                } else if (response[i].match(/_consumption/g)) {                    
                    insertString += "<td class='monetaryshowstorageCostsTableTD'><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'> KWH pa</td>";
                    integersArray.push(response[i]);
                } else if (response[i].match(/_subscription/g)) {                    
                    insertString += "<td class='monetaryshowstorageCostsTableTD'> If renting the storage: <input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";  
                } else {
                    insertString += "<td class='monetaryshowstorageCostsTableTD'><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";
                    numberArray.push(response[i]);
                }

                insertString += "</tr>";
            }
            insertString += "</table>";
            insertString += "<p><input type='submit' class='storageAddInputSubmit' id='storageFormAddButton' value='Add "+table_Name+"'/></p>";
            insertString += "</form></div>"; 
        
        $("#storageMainMIDMainSectionRHS").append(insertString);
        
        $('#storageFormAddSubmit').submit(function(e) {
            
                e.preventDefault();

                var errors = false;
                var error_count = 0;
                $('.addstorageAddFormErrors').remove();
                
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
                                
                var locationCheckValue = $('#'+locationCheck).val();
                var duplicateValue = $('#'+duplicateCheck).val();
                var url1 = 'ajax_checkForDuplicate';
                var duplicate = true;
                var data1 = {};
                data1['tableName'] = tableName1;
                data1['entry'] = duplicateCheck;
                data1['value'] = duplicateValue;
                data1['location'] = locationCheckValue;
                
                $.ajax({
                    type:'GET',
                    url: url1,
                    data: data1,
                    async: false,
                    success: function(response) {
                    
                        if (response === "true") {         
                            error_count+=1;
                            $('.alphanumerictype').after('<div class="addstorageAddFormErrors">&nbspThis '+ tableName +' type is already registered.</div>'); 
                            $('.selectLocation').after('<div class="addstorageAddFormErrors">&nbspAt this location.</div>'); 
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
                    $.post(url, data, function(response) {
                        $('#storageFormAddSubmit')[0].reset();
                        return false;
                    }, 'json');
                }
                return false;
            });
            
        },'json');
        return false;
    });
    
    
    $('#storageMenuChoiceModify').click(function(e){
        e.preventDefault();
        $("#showstorageCostsFormContainer").remove();
        var url = $('#storageFormDelete').attr('action');
        var lastupdatedby=$('#lastupdatedby').val();
        var myjsonforPosting = {};
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var tableName1 = $('#tableName').val().toLowerCase();
        var tableName = toTitleCase(tableName1);
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
      
        var currentupdater = $('#lastupdatedby').val();  
        var insertString = "<div id='showstorageCostsFormContainer'><h2>Modify "+table_Name+" Costs</h2><form name='modifyNetwork'><table id='showstorageCostsTable'>";
        var field = "";
        var numberArray=[];
        var integersArray = [];
        var fieldArray = [];
        var colNames = [];
        var duplicateType=[];
        var duplicateLocation=[];
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowstorageCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];
                
                for (var j = 0; j < response[i + 1].length; j++) {
                    
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowstorageCostsTableTD'><a class='storageModify' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                        insertString += "<td class='"+j+"' id='emptyshowstorageCostsTableTD'></td>";
                    } else if (response[i].match(/_type/g)) {
                        insertString += "<th class='"+j+"'><input class='alphanumeric' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + " 'maxlength='30'/></th>";
                        fieldArray.push(response[i]+j);
                        var duplicateCheck = response[i];
                        var duplicateCheckField = response[i];
                        duplicateType.push(response[i + 1][j][field]);
                    } else if (response[i].match(/_purchase_date/g)) {                    
                        insertString += "<td class='"+j+"'><script type='text/javascript'> $(function() {$('.datepicker').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='datepicker' type='text' id='" + response[i] + j+ "' value='" + response[i + 1][j][field] + "'></td>";
                    } else if (response[i].match(/_description/g)) {                    
                        insertString += "<td class='"+j+"'><textarea class='textareaInput' id='" + response[i] + j +"' rows='5' cols='30'>"+ response[i + 1][j][field] +"</textarea></td>";
                    } else if (response[i].match(/memory/g) || response[i].match(/_qty/g) || response[i].match(/_capacity/g) || response[i].match(/_consumption/g) || response[i].match(/_size/g) || response[i].match(/_ports/g) || response[i].match(/_term/g) || response[i].match(/_lifespan/g)){
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></td>";
                        integersArray.push(response[i]+j);
                    } else if (response[i].match(/assignment/g)) {
                        insertString += "<td class='"+j+"'><select class='selectCurrency' id='"+response[i]+j+ "' name='"+response[i]+"'>";
                        var checkCurrent = response[i + 1][j][field];
                        $.ajax({
                        type:'GET',
                        url: 'ajax_getAssignment',
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
                    } else if (response[i].match(/_location/g)) {
                        insertString += "<td class='"+j+"'><select class='selectLocation' id='"+response[i]+j+ "' name='"+response[i]+"'>";
                        var checkCurrent = response[i + 1][j][field];
                        duplicateLocation.push(response[i + 1][j][field]);
                        $.ajax({
                        type:'GET',
                        url: 'ajax_getLocation',
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
                        
                        var locationCheck = response[i];
                        
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
                    } else if (response[i].match(/_name/g)){
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></td>";
                    } else {
                        insertString += "<td class='"+j+"'><input id='" + response[i]+j + "' class='inputModify' value='" + response[i+1][j][field] + "' maxlength='14'></td>";
                        numberArray.push(response[i]+j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#storageMainMIDMainSectionRHS").append(insertString);
            
            $(".storageModify").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');   
                var errors = false;
                var error_count=0;
                
                $('.addstorageAddFormErrors').remove();

                if ($('.alphanumerictype').val() === "") {
                    $('.alphanumerictype').after('<div class="addstorageAddFormErrors">&nbspThis Category cannot be empty</div>');
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
                
                var locationCheckValue = $('#'+locationCheck+colnum).val();
                var duplicateValue = $('#'+duplicateCheck+colnum).val();
                var url1 = 'ajax_checkForDuplicate';
                var data1 = {};
                data1['tableName'] = tableName1;
                data1['entry'] = duplicateCheckField;
                data1['value'] = duplicateValue;
                data1['location'] = locationCheckValue;
                
                if (duplicateType[colnum] !== duplicateValue && duplicateLocation[colnum] !== locationCheckValue) {
                
                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {       
                            if (response === "true") {         
                                error_count+=1;
                                $('#'+tableName1+'_type'+colnum).after('<div class="addstorageAddFormErrors">&nbspAt this location.</div>'); 
                                $('#'+tableName1+'_type'+colnum).after('<div class="addstorageAddFormErrors">&nbspThis '+ tableName +' type is already registered.</div>'); 
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
                    $.post('ajax_storageModify', myjsonforPosting, function(o) {
                        

                    }, 'json');
                    $("." + colnum).hide();
                    
                }
                return false;
            });
        
            return false;
        }, 'json');
    });
    
    
    $('#storageMenuChoiceDelete').click(function(){
        $("#showstorageCostsFormContainer").remove();
        var url = $('#storageFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        tableName = toTitleCase(tableName);
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        var tableName1 = $('#tableName').val();
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var insertString = "<div id='showstorageCostsFormContainer'><h2>Current "+ table_Name +" Assets</h2><table id='showstorageCostsTable'>";
        var field = "";
        var thisCurrency = [];
        
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowstorageCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowstorageCostsTableTD'><a class='storageDelete' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                    } else if (response[i].match(/_type/g)) {
                        insertString += "<th class='"+j+"'>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];                       
                        insertString += "<td class='"+j+"' id='currencyShow'>"+ response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td class='"+j+"'><span class='currency"+j+"' id='currencyShow'></span> " + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_consumption/g)) {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + " KWH pa</td>";
                    } else if (response[i].match(/_rack_size/g)) {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + " u</td>";
                    } else if (response[i].match(/_description/g)) {
                        insertString += "<td class='"+j+"'><textarea cols='35' rows='5'>" + response[i + 1][j][field] + "</textarea></td>";
                    } else {
                        insertString += "<td nowrap class='"+j+"'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#storageMainMIDMainSectionRHS").append(insertString);
            for (var i=0; i<=thisCurrency.length;i++) {
                $('.currency'+i).text(''+thisCurrency[i]);
            }
            
            $(".storageDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                
                $.post('ajax_storageDelete', {'id': uid, 'tableName':tableName1}, function(o) {
                    
                    
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
