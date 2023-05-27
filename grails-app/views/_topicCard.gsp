<%@ page import="linksharing.Subscription" %>
<div class="row">
    <div class="col-4">
        <g:img dir="images" id="profilePhoto"  file="${session.user.photo}" width="120" height="120"/>
    </div>
    <div class="col">
        <div class="row">
            <h4>${topic.name} (${topic.visibility})</h4>
        </div>
        <div class="row">
            <h5>@${topic.createdBy.userName}</h5>
        </div>
        <div class="row">
            <div class="col">
                <p>Subscriptions:<g:link controller="allShow" action="topicSubs" params="[name:topic.name]">${sub.size}</g:link></p>
            </div>
            <div class="col">
                <p>Posts:${link.size+doc.size}</p>
            </div>
        </div>
        <div class="row">
            <g:if test="${session.user.userName!=topic.createdBy.userName}">
                <g:if test="${Subscription.findByUserAndTopic(session.user,topic)}">
                    <p><a href="#" onclick="Unsubscribe(${topic.id},${session.user.id})">Unsubscribe</a>
                    </p>
                </g:if>
                <g:else>
                    <p><a href="#" onclick="subscribeTopic(${topic.id},${session.user.id})">Subscribe
                    </a></p>
                </g:else>
            </g:if>
        </div>
    </div>
</div>