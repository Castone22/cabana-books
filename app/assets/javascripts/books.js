// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$.validator.addMethod('requiredNotBlank', function(value, element){
    return $.validator.methods.required.call(this, $.trim(value), element);
}, $.validator.messages.required); // I have no idea how to test this without setting up a fixture of some type...

function validateBookSearch(){
    $('#book_search_form').validate({
        errorElement : 'div',
        errorClass: 'error right',
        errorPlacement: function(error, element) {
            var placement = $(element).data('error');
            if (placement) {
                $(placement).append(error)
            } else {
                error.insertAfter(element);
            }
        },
        debug: false,
        rules: {
            "book[search]": {requiredNotBlank: true}
        }
    });
}

$(document).ready(validateBookSearch);
$(document).on('page:load', validateBookSearch);
