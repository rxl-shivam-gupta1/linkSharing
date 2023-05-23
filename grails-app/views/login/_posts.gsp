<%@ page import="linksharing.Visibility; linksharing.Seriousness; linksharing.Topic" %>
<div class="row list">
    <div class="col">
        <g:if test="${params.controller=='dashboard'}">
            <g:each in="${tList}" var="p">
                <div class="row">
                    <div class="col-2">
                            <asset:image src="user (2).png"/>
                    </div>
                    <div class="col-4">
                        <p>
                            ${p.user.firstName} ${p.user.lastName}
                            <g:link controller="profile" action="index"
                                    params="[firstName:p.user.firstName,lastName:p.user.lastName,
                                             userName:p.user.userName]">
                                @${p.user.userName}</g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <g:link controller="topic" action="show" params="[name:p.topic.name]">
                            ${p.topic.name}
                        </g:link>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="dropdown">
                            <g:select class="form-select" id="seriousness_${p.id}" name="seriousness_${p.id}"
                                  value="${p.seriousness}" aria-label="Select seriousness"
                                  from="${Seriousness.values()}" onclick="editSeriousness('${p.id}')">
                            </g:select>
                        </div>
                    </div>
                    <div class="col">
                        <g:if test="${session.user.id}==${p.topic.createdBy.id}">
                        <div class="dropdown">
                            <g:select class="form-select" id="visibility_${p.topic.id}" name="Visibility_${p.topic.id}"
                                      value="${p.topic.visibility}" aria-label="Select visibility"
                                      from="${Visibility.values()}" onclick="editVisibility('${p.topic.id}')">
                            </g:select>
                        </div>
                        </g:if>
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
        <g:elseif test="${params.controller=='profile'}">
            <g:each in="${tList}" var="p">
                <div class="row">
                    <div class="col-2">
                        <asset:image src="user (2).png"/>
                    </div>
                    <div class="col-4">
                        <p>
                            ${p.user.firstName} ${p.user.lastName}
                            <g:link controller="profile" action="index"
                                    params="[firstName:p.user.firstName,lastName:p.user.lastName,
                                             userName:p.user.userName]">
                                @${p.user.userName}</g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <g:link controller="topic" action="show" params="[name:p.topic.name]">
                            ${p.topic.name}
                        </g:link>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="dropdown">
                            <g:select class="form-select" id="seriousness_${p.id}" name="seriousness_${p.id}"
                                      value="${p.seriousness}" aria-label="Select seriousness"
                                      from="${Seriousness.values()}" onclick="editSeriousness('${p.id}')">
                            </g:select>
                        </div>
                    </div>
                    <div class="col">
                        <g:if test="${session.user.id}==${p.topic.createdBy.id}">
                            <div class="dropdown">
                                <g:select class="form-select" id="visibility_${p.topic.id}" name="Visibility_${p.topic.id}"
                                          value="${p.topic.visibility}" aria-label="Select visibility"
                                          from="${Visibility.values()}" onclick="editVisibility('${p.topic.id}')">
                                </g:select>
                            </div>
                        </g:if>
                    </div>
                </div>
                <hr>
            </g:each>
            <g:each in="${rList}" var="p">
                <div class="row">
                    <div class="col-2">
                        <asset:image src="user (2).png"/>
                    </div>
                    <div class="col-4">
                        <p>
                            ${p.createdBy.firstName} ${p.createdBy.lastName}
                            @${p.createdBy.userName}
                        </p>
                    </div>
                    <div class="topicName col">
                        <g:link controller="topic" action="show" params="[name:p.topic.name]">
                            ${p.topic.name}
                        </g:link>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <g:if test="${p.url}"><a href="${p.url}">${p.url}</a></g:if>
                        <g:else>${p.filepath}</g:else>
                    </div>
                </div>
                <div class="row">
                    ${p.description}
                </div>
                <hr>
            </g:each>
        </g:elseif>
        <div class="pagination">
            <g:paginate total="${tCount ?: 0}" max="5" maxsteps="3"/>
        </div>
    </div>
</div>
