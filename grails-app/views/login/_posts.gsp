<%@ page import="linksharing.Subscription; linksharing.Visibility; linksharing.Seriousness; linksharing.Topic" %>
<div class="row list">
    <div class="col">
        <g:if test="${params.controller=='dashboard' || params.controller=='viewPost'}">
            <g:if test="${type=='subscription'}">
            <g:each in="${sList}" var="p">
                <div class="row">
                    <div class="col-2">
                            <asset:image src="user (2).png"/>
                    </div>
                    <div class="col-4">
                        <p>
                            ${p.topic.createdBy.firstName} ${p.topic.createdBy.lastName}
                            <g:link controller="profile" action="index"
                                    params="[userName:p.topic.createdBy.userName]">@${p.topic.createdBy.userName}</g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <g:link controller="topicShow" action="index" params="[name:p.topic.name]">
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
                        <g:if test="${(session.user.id==p.topic.createdBy.id) || session.user.admin==true}">
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
            <div class="pagination">
                <g:paginate total="${sCount ?: 0}" max="5" maxsteps="3"/>
            </div>
            </g:if>
            <g:if test="${type=='topic'}">
                <g:each in="${tList}" var="p">
                    <div class="row">
                        <div class="col-2">
                            <asset:image src="user (2).png"/>
                        </div>
                        <div class="col-4">
                            <p>
                                ${p.createdBy.firstName} ${p.createdBy.lastName}
                                <g:link controller="profile" action="index"
                                        params="[userName:p.createdBy.userName]">@${p.createdBy.userName}</g:link>
                            </p>
                        </div>
                        <div class="topicName col">
                            <g:link controller="topicShow" action="index" params="[name:p.name]">
                                ${p.name}
                            </g:link>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <g:if test="${session.user.userName!=p.createdBy.userName}">
                            <g:if test="${Subscription.findByUserAndTopic(session.user,p as Topic)}">
                                <p><a href="#" onclick="Unsubscribe(${p.id},${session.user.id})">Unsubscribe</a></p>
                            </g:if>
                            <g:else>
                                <p><a href="#" onclick="subscribeTopic(${p.id},${session.user.id})">Subscribe</a></p>
                            </g:else>
                            </g:if>
                        </div>
                    </div>
                    <hr>
                </g:each>
                <div class="pagination">
                    <g:paginate total="${tCount ?: 0}" max="5" maxsteps="3"/>
                </div>
            </g:if>
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
                            <g:link controller="profile" action="index" params="[userName:p.createdBy.userName]">
                                @${p.createdBy.userName}
                            </g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <g:link controller="topicShow" action="index" params="[name:p.name]">
                            ${p.name}
                        </g:link>
                    </div>
                </div>
                <hr>
            </g:each>
            <div class="pagination">
                <g:paginate total="${tCount ?: 0}" max="5" maxsteps="3"/>
            </div>
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
                                    params="[userName:p.user.userName]">@${p.user.userName}</g:link>
                        </p>
                    </div>
                    <div class="topicName col">
                        <g:link controller="topicShow" action="index" params="[name:p.topic.name]">
                            ${p.topic.name}
                        </g:link>
                    </div>
                </div>
                <g:if test="${session.user}">
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
                </g:if>
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
                        <g:link controller="topicShow" action="index" params="[name:p.topic.name]">
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
        <g:elseif test="${params.controller=='topicShow'}">
            <g:if test="${type=='user'}">
            <g:each in="${uList}" var="p">
                <div class="row">
                    <div class="col-2">
                        <asset:image src="user (2).png"/>
                    </div>
                    <div class="col-5">
                        <p>
                            ${p.user.firstName} ${p.user.lastName}
                            <g:link controller="profile" action="index" params="[userName:p.user.userName]">
                                @${p.user.userName}
                            </g:link>
                        </p>
                    </div>
                </div>
                <hr>
            </g:each>
            <div class="pagination">
                <g:paginate total="${uCount ?: 0}" max="5" maxsteps="3"/>
            </div>
            </g:if>
            <g:if test="${type=='post'}">
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
                            <g:link controller="topicShow" action="index" params="[name:p.topic.name]">
                                ${p.topic.name}
                            </g:link>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <g:if test="${p.url}"><a href="${p.url}">${p.url}</a></g:if>
                            <g:else>${p.filePath}</g:else>
                        </div>
                    </div>
                    <div class="row">
                        ${p.description}
                    </div>
                    <div class="row">
                        <g:link controller="viewPost" action="index" params="[topic:p.topic.name]">View Post</g:link>
                    </div>
                    <hr>
                </g:each>
            </g:if>
        </g:elseif>
    </div>
</div>
