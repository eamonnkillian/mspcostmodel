/* 
 * This Jquery/Javascript file takes care of the sending and receiving of any
 * data relating to the Data Center Assets Cost Management function within the application. 
 */

$(function() {
    var url = 'ajax_contractModify';

    function checkNumbers(tableName, fieldName) {
        if (fieldName === "") {
            $('#'+tableName+"errorSpan").text('A value cannot be empty - enter zero for nothing');
            return false;
        } else {
            var value = fieldName.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            var intRegex = /^[+\-]?(\.\d+|\d+(\.\d+)?)$/;
            if (!intRegex.test(value)) {
                $('#'+tableName+"errorSpan").text('The values can only be numbers');
                return false;
            } else {
                return true;
            }
        }
    }
    
    function ajaxCall(myjsonforPosting) {
        $.ajax({
            type: 'POST',
            url: url,
            data: myjsonforPosting,
            async: false,
            success: function(response) {
                if (response === "true") {
                    location.reload();
                }
            }, error: function(jqXHR, textStatus, errorThrown) {
                window.location.assign('error/index');
            }
        }, 'json');
    }

    function prepareJson(tableName)
    {
        var lastupdatedby = $('#lastupdatedby').val();
        var tableName = tableName;
        var errors=true;
        var error_count=0;
        var tds = $('#' + tableName).children('table').children('tbody').children('tr').children('td').length;
        var myjsonforPosting = {};
        for (var i = 0; i < tds; i++) {
            
            if($('#' + tableName + "td" + i).parent('td').prop('className') === "tableTD") {
                errors = checkNumbers(tableName, $('#' + tableName + "td" + i).val());
                if (!errors) {
                    error_count+=1;
                }
            } 
            
            if ($('#' + tableName + "tr" + i).val() === "Currency") {
                myjsonforPosting["original_currency"]=$('#'+tableName+'currencyselect'+i).val();
            } else {
                myjsonforPosting["" + $('#' + tableName + "tr" + i).val()] = $('#' + tableName + "td" + i).val();
            }
            
        }    
        if (error_count!==0) {
            var myjsonforPosting=false;
            return myjsonforPosting;
        } else {
            myjsonforPosting["lastupdatedby"] = lastupdatedby;
            myjsonforPosting["tableName"] = tableName;
            return myjsonforPosting;
        }
    }

    $('.imageClick').click(function() {
        var item = $(this).attr("name");
        if ($('#toggleItem').val() === "") {
            $('#toggleItem').val(item);
            $('#' + item).slideToggle(300)
        } else if ($('#toggleItem').val() === item) {
            $('#' + item).slideToggle(300);
            $('#toggleItem').val("item");
        } else {
            $('#' + item).slideToggle(300);
            $('#' + $('#toggleItem').val()).slideToggle(300, function(){
                $('html,body').animate({scrollTop: $(this).top}, 500);
            });
            $('#toggleItem').val(item);
        }
    });


    $('#contract_governanceForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        console.log(myjsonforPosting);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#contract_administrationForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#transition_chargesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#service_operation_chargesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#asset_acquisition_chargesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#third_party_contractsForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#consents_maintenanceForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#benchmarking_chargesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });


    $('#business_continuity_plan_maintenanceForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#business_continuity_testingForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#exit_servicesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#change_managementForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#change_administrationForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#termination_for_convenience_chargesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#termination_for_cause_chargesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#temporary_services_extensionForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#confidentiality_obligationsForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#intellectual_property_rightsForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#indemnitiesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#insurancesForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#regulatory_complianceForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#auditsForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#data_privacyForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#step_in_rightsForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });

    $('#survivalForm').submit(function() {
            var tableName = ($(this).parent().find('input:hidden').val());
            myjsonforPosting = prepareJson(tableName);
            if (myjsonforPosting) {
                ajaxCall(myjsonforPosting);
            }
            return false;
        });
        
    $('#severabilityForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    $('#technology_currencyForm').submit(function() {
        var tableName = ($(this).parent().find('input:hidden').val());
        myjsonforPosting = prepareJson(tableName);
        if (myjsonforPosting) {
            ajaxCall(myjsonforPosting);
        }
        return false;
    });
    
    return false;
});
