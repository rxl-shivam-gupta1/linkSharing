<%@ page import="linksharing.Topic" %>
<div class="row list">
    <div class="col">
        <g:if test="${params.controller=='dashboard' || params.controller=='profile'}">
            <g:each in="${tList}" var="p">
                <div class="row">
                    <div class="col-2">

                            <asset:image src="user (2).png"/>

                    </div>
                    <div class="col-4">
                        <p>
                            ${p.user.firstName} ${p.user.lastName}
                            <g:link controller="profile" action="index">@${p.user.userName}</g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <g:link controller="topic" action="show" params="[name:p.topic.name]">
                            ${p.topic.name}
                        </g:link>
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
                        <g:link controller="topic" action="show" params="[name:p.name]">
                            ${p.name}
                        </g:link>
                    </div>
                </div>
                <hr>
            </g:each>
        </g:elseif>
        <div class="pagination">
            <g:paginate total="${tCount ?: 0}" max="5" maxsteps="3"/>
        </div>
    </div>
</div>
