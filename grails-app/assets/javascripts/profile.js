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
                getTopic();
                getTrendingTopic();
                getCard();
                getInbox();
            },
            error: function(error) {

            }

        });
    });
}

function subscribeTopic(topicId,userId){
    $(document).ready(function(){
        var seriousness=document.getElementById('seriousness_'+topicId)?.value
        $.ajax({
            url: '/Subscription/subscribeTopic',
            type: 'POST',
            data: {topicId:topicId,userId:userId,seriousness:'CASUAL'},
            success: function(response) {
                getTopic();
                getTrendingTopic();
                getCard();
                getInbox();
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
                getTopic();
                getTrendingTopic();
                getInbox();
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
                getTopic();
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
        var newTrendingTopicName = $('#saveTrendingTopic_'+topicId).parent('form').find('input[name="newTrendingTopicName"]').val();
        console.log(newTrendingTopicName)

        $.ajax({
            url: '/editSubscribedTopic/index',
            type: 'POST',
            data: {id: topicId, name: newTrendingTopicName},
            success: function (response) {
                getTrendingTopic();
                getTopic();
                getInbox();
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
}

function getTopic(){
    var grid = $("div.sub");
    $.ajax({
        url:"/profile/subscription",
        method:'GET',
        success:function(data){
            $(grid).fadeOut('fast',function(){$('#post').html(data).fadeIn('slow');});
        }
    })
}
function getTrendingTopic(){
    var grid = $("div.topic");
    $.ajax({
        url:"/profile/trendingTopic",
        method:'GET',
        success:function(data){
            $(grid).fadeOut('fast',function(){$('#trendingTopic').html(data).fadeIn('slow');});
        }
    })
}
function getInbox(){
    var grid = $("div.resource");
    $.ajax({
        url:"/profile/resource",
        method:'GET',
        success:function(data){
            $(grid).fadeOut('fast',function(){$('#inbox').html(data).fadeIn('slow');});
        }
    })
}
function getCard(){
    var grid = $("div.list");
    $.ajax({
        url:"/profile/card",
        method:'GET',
        success:function(data){
            $(grid).fadeOut('fast',function(){$('#userCard').html(data).fadeIn('slow');});
        }
    })
}