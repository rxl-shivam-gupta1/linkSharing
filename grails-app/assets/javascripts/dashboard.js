function editSeriousness(subscriptionId){
    $(document).ready(function(){
        var seriousness=document.getElementById("seriousness_"+subscriptionId).value;
        console.log(seriousness);
        $.ajax({
            url:'/editSubscribedTopic/editSeriousness',
            type: 'POST',
            data: {seriousness,subscriptionId},
            success: function(response) {
                $('#seriousness_'+subscriptionId).attr('value',`${seriousness}`)
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
}
function editVisibility(topicId){
    $(document).ready(function(){
        var visibility=document.getElementById("visibility_"+topicId).value;
        $.ajax({
            url:'/editSubscribedTopic/editVisibility',
            type: 'POST',
            data: {visibility,topicId},
            success: function(response) {
                $('#visibility_'+topicId).attr('value',`${visibility}`);
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }
        })
    });
}
function Unsubscribe(topicId,userId){
    $(document).ready(function(){
        $.ajax({
            url: '/Subscription/unsubscribeTopic',
            type: 'POST',
            data: {topicId:topicId,userId:userId},
            success: function(response) {
                // $('#topic_'+topicId).remove();
                window.location.reload()
            },
            error: function(error) {

            }

        });
    });
}

function subscribeTopic(topicId,userId){
    $(document).ready(function(){
        //var seriousness=document.getElementById('seriousness_'+topicId)?.value
        $.ajax({
            url: '/Subscription/subscribeTopic',
            type: 'POST',
            data: {topicId:topicId,userId:userId,seriousness:'CASUAL'},
            success: function(response) {
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }

        });
    });
}

function markAsRead(resourceId) {
    $(document).ready(function() {
        $.ajax({
            url: '/ReadingItem/markAsRead',
            type: 'POST',
            data: {
                resourceId: resourceId
            },
            success: function(response) {
                $('#resource_' + resourceId).remove();
                window.location.reload();
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
}
