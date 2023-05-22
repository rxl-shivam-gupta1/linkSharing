<%@ page import="linksharing.Topic" %>
<div class="row">
    <div class="col">
        <g:if test="${params.controller=='dashboard' || params.controller=='profile'}">
            <g:each in="${tList}" var="p">
                <div class="row">
                    <div class="photo col-2">
                        <asset:image src="user (2).png"/>
                    </div>
                    <div class="col-4">
                        <p>
                            ${p.user.firstName} ${p.user.lastName}
                            <g:link controller="profile" action="index">@${p.user.userName}</g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <p>${p.topic.name}</p>
                    </div>
                </div>
                <hr>
            </g:each>
        </g:if>
        <g:elseif test="${params.controller=='login'}">
            <g:each in="${tList}" var="p">
                <div class="row">
                    <div class="col-2">
                        <asset:image src="user (2).png"/>
                    </div>
                    <div class="col-5">
                        <p>
                            ${p.createdBy.firstName} ${p.createdBy.lastName}
                            <g:link controller="profile" action="index" params="[firstName:p.createdBy.firstName,lastName:p.createdBy.lastName,userName:p.createdBy.userName]">
                                @${p.createdBy.userName}
                            </g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <p>${p.name}</p>
                    </div>
                </div>
                <hr>
            </g:each>
        </g:elseif>
        <div class="pagination">
            <g:paginate total="${tCount ?: 0}" max="5" maxsteps="5"/>
        </div>
    </div>
</div>
