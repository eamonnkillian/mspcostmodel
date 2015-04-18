/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the Data Center Assets Cost Management function within the application. 
 */

$(function() {
    
    $('#cloudSelect').change(function() {
        $("#showcloudCostsFormContainer").remove();
        $("#cloudMenu").hide();
        var value=$('#cloudSelect').val();        
        $('#tableName').val(value);
        var count = 0;
        var choicesArray=["Show","Add","Modify","Delete"];
        $.each(choicesArray, function(key, val) {
            value = value.replace(/_/g, " ");
            value = toTitleCase(value);
            $('#cloudMenuChoice'+val).val(val+" "+value);
            count++;
            });
        $("#cloudMenu").show();
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
            $('' + fieldName).after('<div class="addcloudAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addcloudAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
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
                $('' + fieldName).after('<div class="addcloudAddFormErrors">&nbspPlease enter monetary amounts only</div>');
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
                $('' + fieldName).after('<div class="addcloudAddFormErrors">&nbspPlease enter integers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    } 

    $('#cloudMenuChoiceShow').click(function(){
        $("#showcloudCostsFormContainer").remove();
        var url = $('#cloudFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var insertString = "<div id='showcloudCostsFormContainer'><h2>Current "+ table_Name +" Assets</h2><table id='showcloudCostsTable'>";
        var field = "";
        var thisCurrency = [];
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowcloudCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowcloudCostsTableTD'></td>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];  
                        insertString += "<td class='currencyShow'>"+ response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_type/g)) {
                        insertString += "<th>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td><span id='currencyShow' class='currency"+j+"'></span> " + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_description/g)) {
                        insertString += "<td><textarea cols='35' rows='5'>" + response[i + 1][j][field] + "</textarea></td>";
                    } else {
                        insertString += "<td>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#cloudMainMIDMainSectionRHS").append(insertString);
            for (var i=0; i<=thisCurrency.length;i++) {
                $('.currency'+i).text(''+thisCurrency[i]);
            }
            return false;
        }, 'json');
        return false;

    });
       
    $('#cloudMenuChoiceAdd').click(function(){
       $("#showcloudCostsFormContainer").remove();
       var url = $('#cloudFormDelete').attr('action');
       var lastupdatedby=$('#lastupdatedby').val();
       var myjsonforPosting = {};
       myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
       var tableName1 = $('#tableName').val().toLowerCase();
       var tableName = toTitleCase(tableName1);
       var table_Name=tableName.replace(/_/g, " ");
       table_Name = toTitleCase(table_Name);
       
       var numberArray = [];
       var fieldArray = [];
       var integerArray = [];
       
       var insertString = "<div id='showcloudCostsFormContainer'><h2>Add "+ table_Name +" Assets</h2><form name='cloudAddAssets' id='cloudFormAddSubmit' action='ajax_cloudAdd' method='post'><table id='showcloudCostsTable'>";
       insertString+="<input type='hidden' name='tableName' value='"+tableName1+"'><input type='hidden' name='lastupdatedby' value='"+ lastupdatedby +"'>"; 
       $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowcloudCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }
                
                if (response[i].match(/_cost/g)) {
                    insertString += "<td class='percentageshowcloudCostsTableTD'><input id='" + response[i] + "' class='costItem' name='" + response[i] + "' maxlength='10'></td>";     
                    numberArray.push(response[i]);
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
                } else if (response[i].match(/_cores/g) || response[i].match(/_processors/g) || response[i].match(/_ports/g) || response[i].match(/_TB/g) || response[i].match(/_cache/g)) {
                    insertString += "<td class='percentageshowcloudCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'></td>";     
                    integerArray.push(response[i]);
                } else if (response[i].match(/memory/g)) {
                    insertString += "<td class='percentageshowcloudCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'></td>";     
                    numberArray.push(response[i]);
                } else if (response[i].match(/_qty/g) || response[i].match(/_term/g) || response[i].match(/_users/g)) {
                    insertString += "<td class='percentageshowcloudCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'></td>";     
                    integerArray.push(response[i]);
                } else if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowcloudCostsTableTD'></td>";
                } else if (response[i].match(/_provider/g)) {
                    insertString += "<td><select class='selectLocation' id='"+response[i]+ "' name='"+response[i]+"'>";
                    
                    $.ajax({
                    type:'GET',
                    url: 'ajax_getProvider',
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
                    
                   
                   var providerCol = response[i];
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
                } else if (response[i].match(/_purchase_date/g)) {                    
                    insertString += "<td><script type='text/javascript'> $(function() {$('#datepicker').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='dateType' type='text' name='" + response[i] + "' id='datepicker' value='01/01/2014'></td>";
                } else if (response[i].match(/_type/g)) {
                    insertString += "<th><input id='" + response[i] + "' class='alphanumerictype' name='" + response[i] + "' maxlength='30'></th>";
                    fieldArray.push(response[i]);
                    var typeCol = response[i];
                } else if (response[i].match(/_description/g)) {                    
                    insertString += "<td><textarea class='textareaInput' id='" + response[i] + "' name='" + response[i] + "' rows='5' cols='30'></textarea></td>";
                } else if (response[i].match(/_subscription/g)) {                    
                    insertString += "<td class='monetaryshowcloudCostsTableTD'> If renting the cloud: <input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";  
                } else {
                    insertString += "<td class='monetaryshowcloudCostsTableTD'><input id='" + response[i] + "' class='monetary' name='" + response[i] + "' maxlength='14'></td>";
                    numberArray.push(response[i]);
                }

                insertString += "</tr>";
            }
            insertString += "</table>";
            insertString += "<p><input type='submit' class='cloudAddInputSubmit' id='cloudFormAddButton' value='Add "+table_Name+"'/></p>";
            insertString += "</form></div>"; 
        
        $("#cloudMainMIDMainSectionRHS").append(insertString);
        
        
        $('#cloudFormAddSubmit').submit(function(e) {
            
                e.preventDefault();

                var errors = false;
                var error_count = 0;
                
                $('.addcloudAddFormErrors').remove();

                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
                    if (errors === true) {
                       error_count+=1;
                       
                    }
                });
                
                $.each(integerArray, function(key, value) {
                    errors = checkIntegers("#" + value);
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
                                
                
                
                var url1 = 'ajax_checkForDuplicate';
                var duplicate = true;
                var data1 = {};
                data1['tableName'] = tableName1;
                data1['typeCol'] = typeCol;
                data1['type'] = $('#'+typeCol).val();
                data1['provider'] = $('#'+providerCol).val();
                data1['providerCol'] = providerCol;
                
                $.ajax({
                    type:'GET',
                    url: url1,
                    data: data1,
                    async: false,
                    success: function(response) {
                    
                        if (response === "true") {         
                            error_count+=1;
                            $('.alphanumerictype').after('<div class="addcloudAddFormErrors">&nbspThis Cloud machine type is already registered.</div>'); 
                            $('.selectLocation').after('<div class="addcloudAddFormErrors">&nbspWith this provider.</div>'); 
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
                        $('#cloudFormAddSubmit')[0].reset();
                        return false;
                    });
                }
                return false;
            });
            
        },'json');
        return false;
    });
    
    
    $('#cloudMenuChoiceModify').click(function(e){
        e.preventDefault();
        $("#showcloudCostsFormContainer").remove();
        var url = $('#cloudFormDelete').attr('action');
        var lastupdatedby=$('#lastupdatedby').val();
        var myjsonforPosting = {};
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var tableName1 = $('#tableName').val().toLowerCase();
        var tableName = toTitleCase(tableName1);
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        var insertString = "<div id='showcloudCostsFormContainer'><h2>Modify "+table_Name+" Costs</h2><form name='modifyNetwork' id='modifyNetwork'><table id='showcloudCostsTable'>";
        var field = "";
        var numberArray=[];
        var integerArray = [];
        var fieldArray = [];
        var colNames = [];
        
        var originalProviders=[];
        var originalTypes=[];
        
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowcloudCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];
                
                for (var j = 0; j < response[i + 1].length; j++) {
                    
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowcloudCostsTableTD'><a class='cloudModify' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                        insertString += "<td class='"+j+"' id='emptyshowcloudCostsTableTD'></td>";
                    } else if (response[i].match(/_type/g)) {
                        insertString += "<th class='"+j+"'><input class='alphanumeric' id='" + response[i] + j +"' value='"+response[i + 1][j][field]+"' 'maxlength='30'/></th>";
                        originalTypes.push(response[i + 1][j][field]);
                        var typeCol = response[i];
                    } else if (response[i].match(/_purchase_date/g)) {                    
                        insertString += "<td class='"+j+"'><script type='text/javascript'> $(function() {$('.datepicker').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='datepicker' type='text' id='" + response[i] + j+ "' value='" + response[i + 1][j][field] + "'></td>";
                    } else if (response[i].match(/_description/g)) {                    
                        insertString += "<td class='"+j+"'><textarea class='textareaInput' id='" + response[i] + j +"' rows='5' cols='30'>"+ response[i + 1][j][field] +"</textarea></td>";
                    } else if (response[i].match(/_qty/g) || response[i].match(/_term/g)){
                        insertString += "<td class='"+j+"'><input class='inputModify' id='" + response[i] + j +"' value='" + response[i + 1][j][field] + "'/></td>";
                        integerArray.push(response[i]+j);
                        fieldArray.push(response[i]+j)
                    } else if (response[i].match(/_cores/g) || response[i].match(/_processors/g)) {
                        insertString += "<td class='"+j+"'><input id='" + response[i] + j +"' class='percentage' name='" + response[i + 1][j][field] + "' maxlength='6'></td>";     
                        integerArray.push(response[i]+j);
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
                    } else if (response[i].match(/_provider/g)) {
                        insertString += "<td class='"+j+"'><select class='selectLocation' id='"+response[i]+j+ "' name='"+response[i]+"'>";
                        var providerCol = response[i];
                        var checkCurrent = response[i + 1][j][field];
                        originalProviders.push(response[i + 1][j][field]);
                        $.ajax({
                        type:'GET',
                        url: 'ajax_getProvider',
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
            $("#cloudMainMIDMainSectionRHS").append(insertString);
            
            
            
            $(".cloudModify").click(function(e) {
                e.preventDefault();                
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');   
                var errors = false;
                var error_count=0;
                
                $('.addcloudAddFormErrors').remove();

                if ($('.alphanumerictype').val() === "") {
                    $('.alphanumerictype').after('<div class="addcloudAddFormErrors">&nbspThis Category cannot be empty</div>');
                    errors = true;
                    error_count+=1;
                }
                
                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
                    if (errors === true) {
                       error_count+=1;
                       
                    }
                });
                
                $.each(integerArray, function(key, value) {
                    errors = checkIntegers("#" + value);
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
                
                
                var currentType = $.trim($('#'+typeCol+colnum).val());
                var currentProvider = $.trim($('#'+providerCol+colnum).val());
                var url1 = 'ajax_checkForDuplicate';
                var data1 = {};
                data1['tableName'] = tableName1;
                data1['provider'] = currentProvider;
                data1['type'] = currentType;
                data1['providerCol'] = providerCol;
                data1['typeCol'] = typeCol;
                
                if (currentType === originalTypes[colnum] && currentProvider === originalProviders[colnum]) {
                    
                } else {
                    
                    $.ajax({
                        type:'GET',
                        url: url1,
                        data: data1,
                        async: false,
                        success: function(response) {       
                            if (response === "true") {         
                                error_count+=1;
                                $('#'+providerCol+colnum).after('<div class="addcloudAddFormErrors">&nbspAt this location.</div>'); 
                                $('#'+tableName1+'_type'+colnum).after('<div class="addcloudAddFormErrors">&nbspThis Cloud machine type is already registered.</div>'); 
                            } else {
                                duplicate = false;
                            }
                        }, error: function(jqXHR, textStatus, errorThrown) {
                         window.location.assign('error/index');
                        }
                      });     
                  
                } 
                
                if (errors === false && error_count === 0) {
                    $.each(colNames, function(key, value) {
                            if (value.match(/drive/g) || value.match(/card/g) ) {
                                myjsonforPosting[''+value] = $('input[name='+value+colnum+']:checked').val();
                            } else if (value !== "id" && value !== "lastupdatedby" && value !== "lastupdated") {
                                myjsonforPosting[''+value] = $("#"+value + colnum).val();
                            }
                        });
                    
                    myjsonforPosting["id"] = uid;
                    myjsonforPosting["lastupdatedby"] = lastupdatedby;
                    
                    $.post('ajax_cloudModify', myjsonforPosting, function(o) {
                    
                    }, 'json');
                    $("." + colnum).hide();
                    
                }
                return false;
            });
        
            return false;
        }, 'json');
    });
    
    
    $('#cloudMenuChoiceDelete').click(function(){
        $("#showcloudCostsFormContainer").remove();
        var url = $('#cloudFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        tableName = toTitleCase(tableName);
        var table_Name=tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        var tableName1 = $('#tableName').val();
        myjsonforPosting["tableName"]=$('#tableName').val().toLowerCase();
        var insertString = "<div id='showcloudCostsFormContainer'><h2>Current "+ table_Name +" Assets</h2><table id='showcloudCostsTable'>";
        var field = "";
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowcloudCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='"+j+"' id='emptyshowcloudCostsTableTD'><a class='cloudDelete' id='"+j+"' href='#' rel='" + response[i+1][j]['id'] + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                    } else if (response[i].match(/_type/g)) {
                        insertString += "<th class='"+j+"'>" + response[i + 1][j][field] + "</th>";
                    } else {
                        insertString += "<td class='"+j+"'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></div>";
            $("#cloudMainMIDMainSectionRHS").append(insertString);
            
            $(".cloudDelete").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                
                $.post('ajax_cloudDelete', {'id': uid, 'tableName':tableName1}, function(o) {
                    
                    
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
