/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the Data Center Assets Cost Management function within the application. 
 */

$(function() {

    $('#allocationsSelect').change(function() {
        $("#showallocationsCostsFormContainer").remove();
        $("#allocationsMenu").hide();
        var value = $('#allocationsSelect').val();
        $('#tableName').val(value);
        value = value.replace(/_/g, " ");
        if (value === "paas") {
            value = "PaaS";
        } else if (value === "saas") {
            value = "SaaS";
        } else if (value === "byod services") {
            value = "BYOD Services";
        } else if (value === "voip services") {
            value = "VOIP Services";
        } else {
            value = toTitleCase(value);
        }

        var count = 0;
        var choicesArray = ["Show", "Add", "Modify", "Delete"];
        $.each(choicesArray, function(key, val) {
            $('#allocationsMenuChoice' + val).val(val + " " + value);
            count++;
        });
        $("#allocationsMenu").show();
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
                $('' + fieldName).after('<div class="addallocationsAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function checkFields(fieldName) {
        if ($('' + fieldName).val() === "") {
            $('' + fieldName).after('<div class="addallocationsAddFormErrors">&nbspThis field cannot be empty</div>');
            return errors = true;
        } else if ($('' + fieldName).val() !== "") {
            var value = $('' + fieldName).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[A-Za-z0-9_\-\s]+$/;
            if (!intRegex.test(value)) {
                $('' + fieldName).after('<div class="addallocationsAddFormErrors">&nbspPlease enter alphanumeric characters only</div>');
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
                $('' + fieldName).after('<div class="addallocationsAddFormErrors">&nbspPlease enter monetary amounts only</div>');
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
                $('' + fieldName).after('<div class="addallocationsAddFormErrors">&nbspPlease enter integers only</div>');
                return errors = true;
            } else {
                return errors = false;
            }
        }
    }

    function commaSeparateNumber(val) {
        while (/(\d+)(\d{3})/.test(val.toString())) {
            val = val.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
        }
        return val;
    }


    $('#allocationsMenuChoiceShow').click(function() {
        $("#showallocationsCostsFormContainer").remove();
        var url = $('#allocationsFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        var table_Name = tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        myjsonforPosting["tableName"] = $('#tableName').val().toLowerCase();
        var insertString = "<div id='showallocationsCostsFormContainer'><h2>Current " + table_Name + "</h2><table id='showallocationsCostsTable'>";
        var field = "";
        var thisCurrency = [];

        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowallocationsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td id='emptyshowallocationsCostsTableTD'></td>";
                    } else if (response[i].match(/_name/g)) {
                        insertString += "<th nowrap>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td><span class='currency" + j + "' id='currencyShow'></span> " + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_consumption/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + " KWH pa</td>";
                    } else if (response[i].match(/_rack_size/g)) {
                        insertString += "<td>" + response[i + 1][j][field] + " u</td>";
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
            $("#allocationsMainMIDMainSectionRHS").append(insertString);
            for (var i = 0; i <= thisCurrency.length; i++) {
                $('.currency' + i).text('' + thisCurrency[i]);
            }
            return false;

        }, 'json');
        return false;

    });

    $('#allocationsMenuChoiceAdd').click(function() {
        $("#showallocationsCostsFormContainer").remove();
        var url = $('#allocationsFormDelete').attr('action');
        var lastupdatedby = $('#lastupdatedby').val();
        var myjsonforPosting = {};
        myjsonforPosting["tableName"] = $('#tableName').val().toLowerCase();
        var tableName1 = $('#tableName').val().toLowerCase();
        var tableName = toTitleCase(tableName1);
        var table_Name = tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        var integersArray = [];
        var numberArray = [];
        var descriptionArray = [];
        var fieldArray = [];
        var insertString = "<div id='showallocationsCostsFormContainer'><h2>Add " + table_Name + " </h2><form name='allocationsAddAssets' id='allocationsFormAddSubmit' action='ajax_allocationsAdd' method='post'><table id='showallocationsCostsTable'>";
        insertString += "<input type='hidden' name='tableName' value='" + tableName1 + "'><input type='hidden' name='lastupdatedby' value='" + lastupdatedby + "'>";
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {

                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowallocationsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowallocationsCostsTableTD'></td>";
                } else if (response[i].match(/description/g)) {
                    insertString += "<td><textarea id='" + response[i] + "' name='" + response[i] + "' rows='5' cols='30'></textarea></td>";
                    descriptionArray.push(response[i]);
                } else if (response[i].match(/_start_date/g)) {
                    insertString += "<td><script type='text/javascript'> $(function() {$('.dateType').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='dateType' type='text' name='" + response[i] + "' id='startdate' value='01/01/2014'></td>";
                } else if (response[i].match(/finish_date/g)) {
                    insertString += "<td><script type='text/javascript'> $(function() {$('.dateType').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='dateType' type='text' name='" + response[i] + "' id='finishdate' value='31/12/2020'></td>";
                } else if (response[i].match(/_name/g)) {
                    insertString += "<td><select id='" + response[i] + "' name='" + response[i] + "'>";
                    var data = {};
                    var tabletosend = tableName1.replace(/_sales/g, "");
                    data['tablename'] = tabletosend;
                    $.ajax({
                        type: 'POST',
                        url: 'ajax_getInformation',
                        async: false,
                        data: data,
                        dataType: 'json',
                        success: function(response1) {
                            for (var i = 0; i < response1.length; i += 1) {
                                insertString += "<option value='" + response1[i] + "'>" + response1[i] + "</option>";
                            }
                        }, error: function(jqXHR, textStatus, errorThrown) {
                            window.location.assign('error/index');
                        }
                    });
                    insertString += "</select></td>";
                } else if (response[i].match(/qty/g)) {
                    insertString += "<td class='percentageshowallocationsCostsTableTD'><input id='" + response[i] + "' class='percentage' name='" + response[i] + "' maxlength='6'></td>";
                    integersArray.push(response[i]);
                }

                insertString += "</tr>";
            }
            insertString += "</table>";
            insertString += "<p><input type='submit' class='allocationsAddInputSubmit' id='allocationsFormAddButton' value='Add " + table_Name + "'/></p>";
            insertString += "</form></div>";

            $("#allocationsMainMIDMainSectionRHS").append(insertString);

            $('#allocationsFormAddSubmit').submit(function(e) {

                e.preventDefault();

                var errors = false;
                var error_count = 0;
                $('.addallocationsAddFormErrors').remove();

                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
                    if (errors === true) {
                        error_count += 1;

                    }
                });

                $.each(descriptionArray, function(key, value) {
                    errors = checkDescription("#" + value);
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

                $.each(integersArray, function(key, value) {
                    errors = checkIntegers("#" + value);
                    if (errors === true) {
                        error_count += 1;

                    }
                });

                var totalVMsAvail = Number($('#totalVMsAvailable').text().replace(/,/g, ''));
                var totalMBsAvail = Number($('#totalMBsAvailable').text().replace(/,/g, ''));
                var totalGBsAvail = Number($('#totalGBsAvailable').text().replace(/,/g, ''));
                var totalBandwidthAvailable = Number($('#totalBandwidthAvailable').text().replace(/,/g, ''));
                var totalPersonDaysAvailable = Number($('#totalPersonDaysAvailable').text().replace(/,/g, ''));
                var quantity = $('#purchased_qty').val();
                var productName = $('#product_name').val();
                var data1 = {};
                data1['tablename'] = tabletosend;
                data1['productname'] = productName;
                $.ajax({
                    type: 'POST',
                    url: 'ajax_getResources',
                    async: false,
                    data: data1,
                    dataType: 'json',
                    success: function(response1) {
                        var resourcesArray = response1;
                        if (resourcesArray.length !== 0 && resourcesArray[0] !== "External_Provider")
                        {
                            resourcesArray.shift();
                            if (tabletosend.match(/_physical_machine/g)) {
                                var deductCores = resourcesArray[0] * 8;
                                var deductMBs = resourcesArray[1];
                                var deductGBs = resourcesArray[2];
                                var newVMsvalue = totalVMsAvail - (deductCores * quantity);
                                var newMBsvalue = totalMBsAvail - (deductMBs * quantity);
                                var newGBsvalue = totalGBsAvail - (deductGBs * quantity);
                                if (newVMsvalue < 0 || newMBsvalue < 0 || newGBsvalue < 0) {
                                    $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Virtual Machines, Memory or Storage</div>');
                                    errors = true;
                                } else {
                                    $('#totalVMsAvailable').text(commaSeparateNumber(newVMsvalue));
                                    $('#totalMBsAvailable').text(commaSeparateNumber(newMBsvalue));
                                    $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                }
                            } else if (tabletosend.match(/_san/g) || tabletosend.match(/_nas/g)) {
                                var deductGBs = resourcesArray[0];
                                var newGBsvalue = totalGBsAvail - (deductGBs * quantity);
                                if (newGBsvalue < 0) {
                                    $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Storage</div>');
                                    errors = true;
                                } else {
                                    $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                }
                            } else if (tabletosend.match(/bandwidth_/g) || tabletosend.match(/_backup/g)) {
                                var deductBandwidth = resourcesArray[0];
                                var newBandwidthvalue = totalBandwidthAvailable - (deductBandwidth * quantity);
                                if (newBandwidthvalue < 0) {
                                    $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Bandwidth</div>');
                                    errors = true;
                                } else {
                                    $('#totalBandwidthAvailable').text(commaSeparateNumber(newBandwidthvalue));
                                }
                            } else if (tabletosend.match(/consult/g)) {
                                var deductPersonDays = resourcesArray[0];
                                var newPersonDaysvalue = totalPersonDaysAvailable - (deductPersonDays * quantity);
                                if (newPersonDaysvalue < 0) {
                                    $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Person Days</div>');
                                    errors = true;
                                } else {
                                    $('#totalPersonDaysAvailable').text(commaSeparateNumber(newPersonDaysvalue));
                                }
                            } else {
                                var deductCores = resourcesArray[0];
                                var deductMBs = resourcesArray[1];
                                var deductGBs = resourcesArray[2];
                                var newVMsvalue = totalVMsAvail - (deductCores * quantity);
                                var newMBsvalue = totalMBsAvail - (deductMBs * quantity);
                                var newGBsvalue = totalGBsAvail - (deductGBs * quantity);
                                if (newVMsvalue < 0 || newMBsvalue < 0 || newGBsvalue < 0) {
                                    $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Virtual Machines, Memory or Storage</div>');
                                    errors = true;
                                } else {
                                    $('#totalVMsAvailable').text(commaSeparateNumber(newVMsvalue));
                                    $('#totalMBsAvailable').text(commaSeparateNumber(newMBsvalue));
                                    $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                }
                            }
                        } else if (resourcesArray[0] === "External_Provider") {
                            errors = false;
                        } else {
                            $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">No valid entries can be made for this product</div>');
                        }
                        return errors;

                    }, error: function(jqXHR, textStatus, errorThrown) {
                        window.location.assign('error/index');
                    }

                });

                if (errors === false && error_count === 0) {

                    var data = $(this).serializeArray();
                    var url = $(this).attr('action');

                    $.ajax({
                        type: 'POST',
                        url: url,
                        data: data,
                        async: false,
                        success: function(response) {
                            $('#allocationsFormAddSubmit')[0].reset();
                        }, error: function(jqXHR, textStatus, errorThrown) {
                            window.location.assign('error/index');
                        }
                    });



                }
                return false;
            });

        }, 'json');
        return false;
    });


    $('#allocationsMenuChoiceModify').click(function(e) {
        e.preventDefault();
        $("#showallocationsCostsFormContainer").remove();
        var url = $('#allocationsFormDelete').attr('action');
        var lastupdatedby = $('#lastupdatedby').val();
        var myjsonforPosting = {};
        myjsonforPosting["tableName"] = $('#tableName').val().toLowerCase();
        var tableName1 = $('#tableName').val().toLowerCase();
        var tableName = toTitleCase(tableName1);
        var table_Name = tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        var currentupdater = $('#lastupdatedby').val();
        var insertString = "<div id='showallocationsCostsFormContainer'><h2>Modify " + table_Name + "</h2><form name='modifyNetwork'><table id='showallocationsCostsTable'>";
        var field = "";
        var numberArray = [];
        var colNames = [];
        var integersArray = [];
        var fieldArray = [];
        var descriptionArray = [];
        var duplicateType = [];
        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                colNames.push(response[i]);
                insertString += "<tr>";
                if (response[i] === "id" || response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                    insertString += "<td id='emptyshowallocationsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {

                    if (response[i] === "id") {
                        insertString += "<td class='" + j + "' id='emptyshowallocationsCostsTableTD'><a class='allocationsModify' id='" + j + "' href='#' rel='" + response[i + 1][j]['id'] + "'><button id='updateThisColumn' class='updateButton'>Update Entry</button></a></td>";
                    } else if (response[i] === "lastupdatedby" || response[i] === "lastupdated") {
                        insertString += "<td class='" + j + "' id='emptyshowallocationsCostsTableTD'></td>";
                    } else if (response[i].match(/_name/g)) {
                        insertString += "<th nowrap class='" + j + "'><select id='" + response[i] + j + "' name='" + response[i] + j + "'>";
                        var checkCurrent = response[i + 1][j][field];
                        var data = {};
                        var tabletosend = tableName1.replace(/_sales/g, "");
                        data['tablename'] = tabletosend;
                        $.ajax({
                            type: 'POST',
                            url: 'ajax_getInformation',
                            async: false,
                            data: data,
                            dataType: 'json',
                            success: function(response1) {
                                for (var i = 0; i < response1.length; i += 1) {
                                    if (response1[i] === checkCurrent) {
                                        insertString += "<option selected value='" + response1[i] + "'>" + response1[i] + "</option>";
                                    } else {
                                        insertString += "<option value='" + response1[i] + "'>" + response1[i] + "</option>";
                                    }

                                }
                            }, error: function(jqXHR, textStatus, errorThrown) {
                                window.location.assign('error/index');
                            }
                        });
                        insertString += "</select></th>";
                    } else if (response[i].match(/_start_date/g)) {
                        insertString += "<td class='" + j + "'><script type='text/javascript'> $(function() {$('.dateType').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='dateType' type='text' name='" + response[i] + j + "' id='service_start_date" + j + "' value=" + response[i + 1][j][field] + "></td>";
                    } else if (response[i].match(/finish_date/g)) {
                        insertString += "<td class='" + j + "'><script type='text/javascript'> $(function() {$('.dateType').datepicker({dateFormat: 'dd/mm/yy'});}); </script><input class='dateType' type='text' name='" + response[i] + j + "' id='service_finish_date" + j + "' value=" + response[i + 1][j][field] + "></td>";
                    } else if (response[i].match(/amount/g)) {
                        insertString += "<td class='" + j + "'><input class='inputModify' id='" + response[i] + j + "' value='" + response[i + 1][j][field] + "' maxlength='6' size='8'/></td>";
                        integersArray.push(response[i] + j);
                    } else {
                        insertString += "<td class='" + j + "'><input id='" + response[i] + j + "' class='inputModify' value='" + response[i + 1][j][field] + "' maxlength='14'></td>";
                        numberArray.push(response[i] + j);
                    }
                }
                insertString += "</tr>";
            }
            insertString += "</table></form></div>";
            $("#allocationsMainMIDMainSectionRHS").append(insertString);

            $(".allocationsModify").click(function(e) {
                e.preventDefault();
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                var errors = false;
                var error_count = 0;

                $('.addallocationsAddFormErrors').remove();

                if ($('.alphanumerictype').val() === "") {
                    $('.alphanumerictype').after('<div class="addallocationsAddFormErrors">&nbspThis Category cannot be empty</div>');
                    errors = true;
                    error_count += 1;
                }

                $.each(numberArray, function(key, value) {
                    errors = checkNumbers("#" + value);
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

                $.each(integersArray, function(key, value) {
                    errors = checkIntegers("#" + value);
                    if (errors === true) {
                        error_count += 1;

                    }
                });


                var totalVMsAvail = Number($('#totalVMsAvailable').text().replace(/,/g, ''));
                var totalMBsAvail = Number($('#totalMBsAvailable').text().replace(/,/g, ''));
                var totalGBsAvail = Number($('#totalGBsAvailable').text().replace(/,/g, ''));
                var totalBandwidthAvailable = Number($('#totalBandwidthAvailable').text().replace(/,/g, ''));
                var totalPersonDaysAvailable = Number($('#totalPersonDaysAvailable').text().replace(/,/g, ''));
                var newQty = $('#purchased_qty' + colnum).val();
                var originalQty = response[9][colnum]['purchased_qty'];
                var productName = $('#product_name' + colnum).val();
                var tabletosend = tableName1.replace(/_sales/g, "");
                var data1 = {};
                data1['productname'] = productName;
                data1['tablename'] = tabletosend;
                $.ajax({
                    type: 'POST',
                    url: 'ajax_getResources',
                    async: false,
                    data: data1,
                    dataType: 'json',
                    success: function(response1) {
                        var resourcesArray = response1;
                        var originalQty = response[9][colnum]['purchased_qty'];
                        var delta = originalQty - newQty;

                        if (resourcesArray.length !== 0 && resourcesArray[0] !== "External_Provider")
                        {
                            resourcesArray.shift();
                            if (tabletosend.match(/_physical_machine/g)) {
                                var deductCores = resourcesArray[0] * 8;
                                var deductMBs = resourcesArray[1];
                                var deductGBs = resourcesArray[2];
                                var newVMsvalue = totalVMsAvail + (deductCores * delta);
                                var newMBsvalue = totalMBsAvail + (deductMBs * delta);
                                var newGBsvalue = totalGBsAvail + (deductGBs * delta);
                                if (newVMsvalue < 0 || newMBsvalue < 0 || newGBsvalue < 0) {
                                    console.log("in here checing if less than zero");
                                    $('#showallocationsCostsTable').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Virtual Machines, Memory or Storage</div>');
                                    errors = true;
                                } else {
                                    $('#totalVMsAvailable').text(commaSeparateNumber(newVMsvalue));
                                    $('#totalMBsAvailable').text(commaSeparateNumber(newMBsvalue));
                                    $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                }
                            } else if (tabletosend.match(/_san/g) || tabletosend.match(/_nas/g)) {
                                var deductGBs = resourcesArray[0];
                                var newGBsvalue = totalGBsAvail + (deductGBs * delta);
                                if (newGBsvalue < 0) {
                                    $('#showallocationsCostsTable').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Storage</div>');
                                    errors = true;
                                } else {
                                    $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                }
                            } else if (tabletosend.match(/bandwidth_/g) || tabletosend.match(/_backup/g)) {
                                var deductBandwidth = resourcesArray[0];
                                var newBandwidthvalue = totalBandwidthAvailable + (deductBandwidth * delta);
                                if (newBandwidthvalue < 0) {
                                    $('#showallocationsCostsTable').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Bandwidth</div>');
                                    errors = true;
                                } else {
                                    $('#totalBandwidthAvailable').text(commaSeparateNumber(newBandwidthvalue));
                                }
                            } else if (tabletosend.match(/consult/g)) {
                                var deductPersonDays = resourcesArray[0];
                                var newPersonDaysvalue = totalPersonDaysAvailable + (deductPersonDays * delta);
                                if (newPersonDaysvalue < 0) {
                                    $('#showallocationsCostsTable').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Person Days</div>');
                                    errors = true;
                                } else {
                                    $('#totalPersonDaysAvailable').text(commaSeparateNumber(newPersonDaysvalue));
                                }
                            } else {
                                var addCores = resourcesArray[0];
                                var addMBs = resourcesArray[1];
                                var addGBs = resourcesArray[2];
                                console.log("total avile is " + totalVMsAvail + " and addcores is " + addCores + " times by " + delta);
                                var newVMsvalue = totalVMsAvail + (addCores * delta);
                                var newMBsvalue = totalMBsAvail + (addMBs * delta);
                                var newGBsvalue = totalGBsAvail + (addGBs * delta);
                                if (newVMsvalue < 0 || newMBsvalue < 0 || newGBsvalue < 0) {
                                    $('#showallocationsCostsTable').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Virtual Machines, Memory or Storage</div>');
                                    errors = true;
                                } else {
                                    $('#totalVMsAvailable').text(commaSeparateNumber(newVMsvalue));
                                    $('#totalMBsAvailable').text(commaSeparateNumber(newMBsvalue));
                                    $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                }
                            }
                        } else if (resourcesArray[0] === "External_Provider") {
                            errors = false;
                        } else {
                            $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">No valid entries can be made for this product deletion</div>');
                        }
                        return errors;

                    }, error: function(jqXHR, textStatus, errorThrown) {
                        window.location.assign('error/index');
                    }
                });

                if (errors === false && error_count === 0) {
                    var myjsonforPosting = {};
                    myjsonforPosting["currentupdater"] = currentupdater;
                    myjsonforPosting["tableName"] = tableName1;
                    myjsonforPosting["service_start_date"] = $('#service_start_date' + colnum);
                    myjsonforPosting["service_finish_date"] = $('#service_finish_date' + colnum);
                    $.each(colNames, function(key, value) {
                        if (value !== "id" && value !== "lastupdatedby") {
                            myjsonforPosting['' + value] = $("#" + value + colnum).val();
                        }
                    });
                    myjsonforPosting["id"] = uid;
                    $.ajax({
                        type: 'POST',
                        url: 'ajax_allocationsModify',
                        data: myjsonforPosting,
                        async: false,
                        success: function(response1) {
                            $("." + colnum).hide();
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


    $('#allocationsMenuChoiceDelete').click(function() {
        $("#showallocationsCostsFormContainer").remove();
        var url = $('#allocationsFormDelete').attr('action');
        var myjsonforPosting = {};
        var tableName = $('#tableName').val();
        tableName = toTitleCase(tableName);
        var tableName1 = $('#tableName').val();
        var table_Name = tableName.replace(/_/g, " ");
        table_Name = toTitleCase(table_Name);
        myjsonforPosting["tableName"] = $('#tableName').val().toLowerCase();
        var insertString = "<div id='showallocationsCostsFormContainer'><h2>Current " + table_Name + " Assets</h2><table id='showallocationsCostsTable'>";
        var field = "";
        var thisCurrency = [];

        $.post(url, myjsonforPosting, function(response) {
            for (var i = 0; i < response.length; i += 2) {
                insertString += "<tr>";
                if (response[i] === "id") {
                    insertString += "<td id='emptyshowallocationsCostsTableTD'></td>";
                } else {
                    var tableEntry = response[i];
                    tableEntry = tableEntry.replace(/_/g, " ");
                    tableEntry = toTitleCase(tableEntry);
                    insertString += "<th nowrap>" + tableEntry + "</th>";
                }

                field = response[i];

                for (var j = 0; j < response[i + 1].length; j++) {
                    if (response[i] === "id") {
                        insertString += "<td class='" + j + "' id='emptyshowallocationsCostsTableTD'><a class='allocationsDelete' id='" + j + "' href='#' rel='" + response[i + 1][j]['id'] + "'><button id='deleteThisColumn' class='deleteButton'>Delete Entry</button></a></td>";
                        ;
                    } else if (response[i].match(/_name/g)) {
                        insertString += "<th nowrap class='" + j + "' id='" + response[i] + j + "'>" + response[i + 1][j][field] + "</th>";
                    } else if (response[i].match(/_cost/g)) {
                        insertString += "<td class='" + j + "'><span class='currency" + j + "' id='currencyShow'></span> " + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_qty/g)) {
                        insertString += "<td class='" + j + "' id='" + response[i] + j + "'>" + response[i + 1][j][field] + "</td>";
                    } else if (response[i].match(/_rack_size/g)) {
                        insertString += "<td class='" + j + "'>" + response[i + 1][j][field] + " u</td>";
                    } else if (response[i].match(/currency/g)) {
                        thisCurrency[j] = response[i + 1][j][field];
                        insertString += "<td id='currencyShow' class='" + j + "'>" + response[i + 1][j][field] + "</td>";
                    } else {
                        insertString += "<td class='" + j + "'>" + response[i + 1][j][field] + "</td>";
                    }
                }
                insertString += "</tr>";
            }

            insertString += "</table></div>";
            $("#allocationsMainMIDMainSectionRHS").append(insertString);
            for (var i = 0; i <= thisCurrency.length; i++) {
                $('.currency' + i).text('' + thisCurrency[i]);
            }

            $(".allocationsDelete").click(function(e) {
                e.preventDefault();
                var tabletosend = tableName1.replace(/_sales/g, "");
                var data = {};
                var uid = $(this).attr('rel');
                var colnum = $(this).attr('id');
                data['id'] = uid;
                data['tableName'] = tableName1;
                $.ajax({
                    type: 'POST',
                    url: 'ajax_allocationsDelete',
                    data: data,
                    async: false,
                    success: function(response) {
                        if (response === "done") {
                            var totalVMsAvail = Number($('#totalVMsAvailable').text().replace(/,/g, ''));
                            var totalMBsAvail = Number($('#totalMBsAvailable').text().replace(/,/g, ''));
                            var totalGBsAvail = Number($('#totalGBsAvailable').text().replace(/,/g, ''));
                            var totalBandwidthAvailable = Number($('#totalBandwidthAvailable').text().replace(/,/g, ''));
                            var totalPersonDaysAvailable = Number($('#totalPersonDaysAvailable').text().replace(/,/g, ''));
                            var quantity = $('#purchased_qty' + colnum).html();
                            var productName = $('#product_name' + colnum).html();
                            var data1 = {};
                            data1['tablename'] = tabletosend;
                            data1['productname'] = productName;
                            $.ajax({
                                type: 'POST',
                                url: 'ajax_getResources',
                                async: false,
                                data: data1,
                                dataType: 'json',
                                success: function(response1) {
                                    var resourcesArray = response1;
                                    if (resourcesArray.length !== 0 && resourcesArray[0] !== "External_Provider")
                                    {
                                        resourcesArray.shift();
                                        if (tabletosend.match(/_physical_machine/g)) {
                                            var deductCores = resourcesArray[0] * 8;
                                            var deductMBs = resourcesArray[1];
                                            var deductGBs = resourcesArray[2];
                                            var newVMsvalue = totalVMsAvail + (deductCores * quantity);
                                            var newMBsvalue = totalMBsAvail + (deductMBs * quantity);
                                            var newGBsvalue = totalGBsAvail + (deductGBs * quantity);
                                            if (newVMsvalue < 0 || newMBsvalue < 0 || newGBsvalue < 0) {
                                                $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Virtual Machines, Memory or Storage</div>');
                                                errors = true;
                                            } else {
                                                $('#totalVMsAvailable').text(commaSeparateNumber(newVMsvalue));
                                                $('#totalMBsAvailable').text(commaSeparateNumber(newMBsvalue));
                                                $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                            }
                                        } else if (tabletosend.match(/_san/g) || tabletosend.match(/_nas/g)) {
                                            var deductGBs = resourcesArray[0];
                                            var newGBsvalue = totalGBsAvail + (deductGBs * quantity);
                                            if (newGBsvalue < 0) {
                                                $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Storage</div>');
                                                errors = true;
                                            } else {
                                                $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                            }
                                        } else if (tabletosend.match(/bandwidth_/g) || tabletosend.match(/_backup/g)) {
                                            var deductBandwidth = resourcesArray[0];
                                            var newBandwidthvalue = totalBandwidthAvailable + (deductBandwidth * quantity);
                                            if (newBandwidthvalue < 0) {
                                                $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Bandwidth</div>');
                                                errors = true;
                                            } else {
                                                $('#totalBandwidthAvailable').text(commaSeparateNumber(newBandwidthvalue));
                                            }
                                        } else if (tabletosend.match(/consult/g)) {
                                            var deductPersonDays = resourcesArray[0];
                                            var newPersonDaysvalue = totalPersonDaysAvailable + (deductPersonDays * quantity);
                                            if (newPersonDaysvalue < 0) {
                                                $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Person Days</div>');
                                                errors = true;
                                            } else {
                                                $('#totalPersonDaysAvailable').text(commaSeparateNumber(newPersonDaysvalue));
                                            }
                                        } else {
                                            var addCores = resourcesArray[0];
                                            var addMBs = resourcesArray[1];
                                            var addGBs = resourcesArray[2];

                                            var newVMsvalue = totalVMsAvail + (addCores * quantity);
                                            var newMBsvalue = totalMBsAvail + (addMBs * quantity);
                                            var newGBsvalue = totalGBsAvail + (addGBs * quantity);
                                            if (newVMsvalue < 0 || newMBsvalue < 0 || newGBsvalue < 0) {
                                                $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">&nbspCannot have a negative value for Virtual Machines, Memory or Storage</div>');
                                                errors = true;
                                            } else {
                                                $('#totalVMsAvailable').text(commaSeparateNumber(newVMsvalue));
                                                $('#totalMBsAvailable').text(commaSeparateNumber(newMBsvalue));
                                                $('#totalGBsAvailable').text(commaSeparateNumber(newGBsvalue));
                                            }
                                        }
                                    } else if (resourcesArray[0] === "External_Provider") {
                                        errors = false;
                                    } else {
                                        $('.allocationsAddInputSubmit').after('<div class="addallocationsAddFormErrors">No valid entries can be made for this product deletion</div>');
                                    }
                                    $("." + colnum).hide();

                                }, error: function(jqXHR, textStatus, errorThrown) {
                                    window.location.assign('error/index');
                                }
                            });
                            return false;
                        }
                    }, error: function(jqXHR, textStatus, errorThrown) {
                        window.location.assign('error/index');
                    }
                });
                return false;
            });
            return false;
        }, 'json');
        return false;
    });
    return false;
});
