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

function editTopicName(topicId) {
    $(document).ready(function () {
        $('#topicName_' + topicId).hide();
        $('#editTopicClass_' + topicId).show();
    });
}
function cancelTopic(topicId) {
    $(document).ready(function () {
        $('#topicName_' + topicId).show();
        $('#editTopicClass_' + topicId).hide();
    });
}
function saveTopic(topicId) {
    $(document).ready(function () {
        var newTopicName = $('#saveTopic_'+topicId).parent('form').find('input[name="newTopicName"]').val();
        console.log(newTopicName)

        $.ajax({
            url: '/editSubscribedTopic/index',
            type: 'POST',
            data: {id: topicId, name: newTopicName},
            success: function (response) {
                $('#topicName_' + topicId).text(newTopicName).show();
                $('#editTopicClass_' + topicId).hide();
                // window.location.reload()
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
}

function deleteTopic(topicId){
    $(document).ready(function(){
        $.ajax({
            url: '/editSubscribedTopic/deleteTopic',
            type: 'POST',
            data: {topicId:topicId},
            success: function(response) {
                // $('#topic_'+topicId).remove()
                // $('#manage_'+topicId).remove()
                // $('#edit_'+topicId).remove()
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }

        });
    });
}

function editTrendingTopicName(topicId) {
    $(document).ready(function () {
        $('#trendingTopicName_' + topicId).hide();
        $('#editTrendingTopicClass_' + topicId).show();
    });
}
function cancelTrendingTopic(topicId) {
    $(document).ready(function () {
        $('#trendingTopicName_' + topicId).show();
        $('#editTrendingTopicClass_' + topicId).hide();
    });
}
function saveTrendingTopic(topicId) {
    $(document).ready(function () {
        var newTrendingTopicName = $('input[name="newTrendingTopicName"]').val();
        console.log(newTrendingTopicName)

        $.ajax({
            url: '/editSubscribedTopic/index',
            type: 'POST',
            data: {id: topicId, name: newTrendingTopicName},
            success: function (response) {
                $('#trendingTopicName_' + topicId).text(newTrendingTopicName).show();
                $('#editTrendingTopicClass_' + topicId).hide();
                // window.location.reload()
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
}
