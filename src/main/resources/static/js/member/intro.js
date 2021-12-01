$(document).ready(function() {
    $('#introduction').on('keyup', function() {
        $('#intro_cnt').html("("+$(this).val().length+" / 100)");

        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#intro_cnt').html("(100 / 100)");
        }
    });
});