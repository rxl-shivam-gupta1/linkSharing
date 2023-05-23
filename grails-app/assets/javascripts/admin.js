function editUserStance(userId,isActive){
    $(document).ready(function() {
        $('.activate-deactivate_'+userId).click(function() {
            isActive=!isActive
            $.ajax({
                url: '/admin/editUserStance',
                type: 'POST',
                data: {
                    userId: userId,
                },
                success: function(response) {
                    var linkText = isActive ? 'Deactivate' : 'Activate';
                    $('#activate-deactivate_'+userId).text(linkText).data('data-isActive', isActive);
                    $('#isActive_'+userId).text(isActive);
                },
                error: function(xhr) {

                }
            });

            return true;
        });
    });
}

function deleteTopic(topicId){
    $(document).ready(function() {
        $('.delete_'+topicId).click(function() {
            $.ajax({
                url: '/Admin/deleteTopic',
                type: 'POST',
                data: {topicId: topicId},
                success: function(response) {
                    $('#deleteTopic_'+topicId).closest('tr').remove();
                },
                error: function(xhr) {
                    alert('Error: ' + xhr.status);
                }
            });
        });
    });
}