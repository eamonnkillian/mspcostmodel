/* 
 * To produce sliders in costs....
 */

$(function() {
    /*$('.imageClick').click(function() {
        var item = $(this).attr("name");
        if ($('#toggleItem').val() === "") {
            $('#toggleItem').val(item);
            $('#' + item).slideToggle(300);
            if (item !== "dcassets" && item !== "offices" && item !== "labour") {
                $('#costsMainMID').animate({scrollTop: $('#' + item).offset().top});
                return false;
            }
        } else if ($('#toggleItem').val() === item) {
            $('#' + item).slideToggle(300);
            if (item !== "dcassets" && item !== "offices" && item !== "labour") {
                $('#costsMainMID').animate({scrollTop: $('#' + item).offset().top});
                return false;
            }
            $('#toggleItem').val("item");
        } else if ($('#toggleItem').val() !== item) {
            $('#' + $('#toggleItem').val()).slideToggle(300);
            $('#toggleItem').val(item);
            $('#' + item).slideToggle(300);
            return false;
        }
        
    });*/
    
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
    
    
    /*$('.imageClickMinor').click(function() {
        var item = $(this).attr("name");
        if ($('#toggleItemMinor').val() === "") {
            $('#toggleItemMinor').val(item);
            $('#' + item).slideToggle(300);
            if (item !== "switches" && item !== "routers" && item !== "loadbalancers") {
                $('#costsMainMID').animate({scrollTop: $('#' + item).offset().top});
            }
        } else if ($('#toggleItemMinor').val() === item) {
            $('#' + item).slideToggle(300);
            if (item !== "switches" && item !== "routers" && item !== "loadbalancers") {
                $('#costsMainMID').animate({scrollTop: $('#' + item).offset().top});
            }
            $('#toggleItemMinor').val("item");
        } else if ($('#toggleItemMinor').val() !== item) {
            $('#' + $('#toggleItemMinor').val()).slideToggle(300);
            $('#toggleItemMinor').val(item);
            $('#' + item).slideToggle(300);
        }
        return false;
    });*/
    
    $('.imageClickMinor').click(function() {
        var item = $(this).attr("name");
        if ($('#toggleItemMinor').val() === "") {
            $('#toggleItemMinor').val(item);
            $('#' + item).slideToggle(300)
        } else if ($('#toggleItemMinor').val() === item) {
            $('#' + item).slideToggle(300);
            $('#toggleItemMinor').val("item");
        } else {
            $('#' + item).slideToggle(300);
            $('#' + $('#toggleItemMinor').val()).slideToggle(300, function(){
                $('html,body').animate({scrollTop: $(this).top}, 500);
            });
            $('#toggleItemMinor').val(item);
        }
    });
    
    
});




