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
function deleteSub(subId){
    $(document).ready(function() {
        $('.delete_'+subId).click(function() {
            $.ajax({
                url: '/Admin/deleteSub',
                type: 'POST',
                data: {subId: subId},
                success: function(response) {
                    $('#deleteSub_'+subId).closest('tr').remove();
                },
                error: function(xhr) {
                    alert('Error: ' + xhr.status);
                }
            });
        });
    });
}
function deletePost(postId){
    $(document).ready(function() {
        $('.delete_'+postId).click(function() {
            $.ajax({
                url: '/Admin/deletePost',
                type: 'POST',
                data: {postId: postId},
                success: function(response) {
                    $('#deletePost_'+postId).closest('tr').remove();
                },
                error: function(xhr) {
                    alert('Error: ' + xhr.status);
                }
            });
        });
    });
}