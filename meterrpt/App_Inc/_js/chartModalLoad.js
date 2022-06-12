

$( document ).ajaxStart(function() {
    $('#page_loading').fadeIn();
});

$( document ).ajaxStop(function() {
    $('#page_loading').fadeOut();
});