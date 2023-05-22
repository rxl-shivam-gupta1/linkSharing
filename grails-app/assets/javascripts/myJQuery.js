$(document).ready(function() {
    setupGridAjax();
});

function setupGridAjax() {
    $("#post").find(".pagination a").click(function(event) {
        event.preventDefault();
        var url = $(this).attr('href');

        var grid = $(this).parents("div.list");

        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
                $(grid).fadeOut('fast', function() {$(this).html(data).fadeIn('slow');});
            }
        });
    });
}