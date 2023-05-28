<%@ page import="linksharing.DocumentResource; linksharing.LinkResource; linksharing.Subscription; linksharing.Visibility; linksharing.Seriousness; linksharing.Topic" %>
<div class="row list">
    <div class="col">
        <g:if test="${params.controller=='dashboard' || params.controller=='viewPost'}">
            <g:if test="${type=='subscription'}">
            <g:each in="${sList}" var="p">
                <div class="row" id="topic_${p.topic.id}">
                    <div class="col-3">
                        <g:img dir="images" id="profilePhoto"  file="${p.user.photo}" width="60" height="60"/>
                    </div>
                    <div class="col-4">
                        <p>
                            <div class="topicName" id="topicName_${p.topic.id}">
                            <g:link controller="topicShow" action="index" params="[name:p.topic.name]">
                                ${p.topic.name}
                            </g:link>
                    </div>
                        <div class="edit-form" id="editTopicClass_${p.topic.id}" style="display:none;">
                            <form>
                                <input type="text" name="newTopicName" required>
                                <button type="button" onclick="saveTopic('${p.topic.id}')"
                                        class="save-button btn btn-primary" id="saveTopic_${p.topic.id}">
                                    Save</button>
                                <button type="button" onclick="cancelTopic('${p.topic.id}')"
                                  class="cancel-button btn btn-primary" id="cancelTopic_${p.topic.id}">
                                    Cancel</button>
                            </form>
                        </div>
                        <div>
                            <g:link controller="profile" action="index"
                                    params="[userName:p.topic.createdBy.userName]">
                                @${p.topic.createdBy.userName}</g:link>
                        </div>
                        </p>
                    </div>
                </div>
                <div class="row" id="manage_${p.topic.id}">
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
                            <g:select class="form-select" id="visibility_${p.topic.id}"
                                      name="Visibility_${p.topic.id}" value="${p.topic.visibility}"
                                      aria-label="Select visibility" from="${Visibility.values()}"
                                      onclick="editVisibility('${p.topic.id}')">
                            </g:select>
                        </div>
                        </g:if>
                    </div>
                </div>
                <div class="row" id="edit_${p.topic.id}">
                    <div class="col manage">
                        <g:render template="/sendInvite" model="[topicId:p.topic.id]"/>
                        <g:if test="${(session.user.id==p.topic.createdBy.id) || session.user.admin==true}">
                            <button type="button"  id="editTopic_${p.topic.id}" class="btn btn-link"
                                    onclick="editTopicName(${p.topic.id})"><asset:image src="writing.png"/>
                            </button>
                            <button type="button"  id="deleteTopic_${p.topic.id}"
                                    class="btn btn-link" onclick="deleteTopic(${p.topic.id})">
                                <asset:image src="bin.png"/></button>
                        </g:if>
                    </div>
                    <hr>
                </div>
            </g:each>
            <div class="pagination">
                <g:paginate total="${sCount ?: 0}" max="5" maxsteps="3"/>
            </div>
            </g:if>
            <g:if test="${type=='topic'}">
                <g:each in="${tList}" var="p">
                    <div class="row">
                        <div class="col-3">
                            <g:img dir="images" id="profilePhoto"  file="${p.createdBy.photo}" width="60" height="60"/>
                        </div>
                        <div class="col-4">
                            <p>
                                <div class="topicName" id="trendingTopicName_${p.id}">
                                <g:link controller="topicShow" action="index" params="[name:p.name]">
                                    ${p.name}
                                </g:link>
                        </div>
                            <div class="edit-form" id="editTrendingTopicClass_${p.id}" style="display:none;">
                                <form>
                                    <input type="text" name="newTrendingTopicName_${p.id}" required>
                                    <button type="button" onclick="saveTrendingTopic('${p.id}')"
                                            class="save-button btn btn-primary" id="saveTrendingTopic_${p.id}">Save</button>
                                    <button type="button" onclick="cancelTrendingTopic('${p.id}')"
                                            class="cancel-button btn btn-primary" id="cancelTrendingTopic_${p.id}">Cancel</button>
                                </form>
                            </div>
                            <div>
                                <g:link controller="profile" action="index"
                                        params="[userName:p.createdBy.userName]">@${p.createdBy.userName}
                                </g:link>
                            </div>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <g:if test="${session.user.userName!=p.createdBy.userName}">
                            <g:if test="${Subscription.findByUserAndTopic(session.user,p as Topic)}">
                                <p><a href="#" onclick="Unsubscribe(${p.id},${session.user.id})">Unsubscribe</a>
                                </p>
                            </g:if>
                            <g:else>
                                <p><a href="#" onclick="subscribeTopic(${p.id},${session.user.id})">Subscribe
                                </a></p>
                            </g:else>
                            </g:if>
                        </div>
                    </div>
                    <div class="row" id="edit_${p.id}">
                        <div class="col manage">
                            <g:render template="/sendInvite" model="[topicId:p.id]"/>
                            <g:if test="${(session.user.id==p.createdBy.id) || session.user.admin==true}">
                                <button type="button"  id="editTrendingTopic_${p.id}" class="btn btn-link"
                                        onclick="editTrendingTopicName(${p.id})"><asset:image src="writing.png"/>
                                </button>
                                <button type="button"  id="deleteTopic_${p.id}" class="btn btn-link"
                                        onclick="deleteTopic(${p.id})"><asset:image src="bin.png"/></button>
                            </g:if>
                        </div>
                        <hr>
                    </div>
                </g:each>
                <div class="pagination">
                    <g:paginate total="${tCount ?: 0}" max="5" maxsteps="3"/>
                </div>
            </g:if>
            <g:if test="${type=='inbox'}">
                <g:each in="${iList}" var="p">
                    <div class="row">
                        <div class="col-3">
                            <g:img dir="images" id="profilePhoto"  file="${p.resource.createdBy.photo}" width="60" height="60"/>
                        </div>
                        <div class="col-4">
                            <p>
                                ${p.resource.createdBy.firstName} ${p.resource.createdBy.lastName}
                                <g:link controller="profile" action="index"
                                        params="[userName:p.resource.createdBy.userName]">@${p.resource.createdBy.userName}</g:link>
                            </p>
                        </div>
                        <div class="topicName col">
                            <g:link controller="topicShow" action="index" params="[name:p.resource.topic.name]">
                                ${p.resource.topic.name}
                            </g:link>
                        </div>
                    </div>
                    <div class="row">
                        ${p.resource.description}
                    </div>
                    <div class="row">
                        <div class="col">
                            <a href="#" onclick="markAsRead(${p.resource.id})">Mark as Read</a>
                        </div>
                        <div class="col">
                            <g:link controller="viewPost" action="index" params="[name:p.resource.topic.name,
                                                                         id:p.resource.id]">View Post</g:link>
                        </div>
                        <div class="col">
                            <g:if test="${p.resource.class== LinkResource}">
                                <a href="${p.resource.url}">View Full Site</a>
                            </g:if>
                            <g:elseif test="${p.resource.class== DocumentResource}">
                                <a href="${p.resource.filePath}" download>Download</a></g:elseif>
                        </div>
                    </div>
                    <hr>
                </g:each>
                <div class="pagination">
                    <g:paginate total="${iCount ?: 0}" max="5" maxsteps="3"/>
                </div>
            </g:if>
        </g:if>
        <g:elseif test="${params.controller=='login'}">
            <g:each in="${tList}" var="p">
                <div class="row">
                    <div class="col-3">
                        <g:img dir="images" id="profilePhoto"  file="${p.createdBy.photo}" width="60" height="60"/>
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
            <g:if test="${type=='subscription'}">
            <g:each in="${sList}" var="p">
                <div class="row">
                    <div class="col-3">
                        <g:img dir="images" id="profilePhoto"  file="${p.topic.createdBy.photo}" width="60" height="60"/>
                    </div>
                    <div class="col-4">
                        <p>
                            ${p.topic.createdBy.firstName} ${p.topic.createdBy.lastName}
                            <g:link controller="profile" action="index"
                                  params="[userName:p.topic.createdBy.userName]">@${p.topic.createdBy.userName}
                            </g:link>
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
                                <g:select class="form-select" id="visibility_${p.topic.id}"
                                          name="Visibility_${p.topic.id}" value="${p.topic.visibility}"
                                          aria-label="Select visibility" from="${Visibility.values()}"
                                          onclick="editVisibility('${p.topic.id}')">
                                </g:select>
                            </div>
                        </g:if>
                    </div>
                </div>
                </g:if>
                <hr>
            </g:each>
            <div class="pagination">
                <g:paginate total="${sCount ?: 0}" max="5" maxsteps="3"/>
            </div>
            </g:if>
            <g:if test="${type=='post'}">
            <g:each in="${rList}" var="p">
                <div class="row">
                    <div class="col-3">
                        <g:img dir="images" id="profilePhoto"  file="${p.createdBy.photo}" width="60" height="60"/>
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
                    ${p.description}
                </div>
                <div class="row">
                <div class="col">
                    <g:link controller="viewPost" action="index" params="[name:p.topic.name,
                                                                          id:p.id]">View Post</g:link>
                </div>
                <div class="col">
                    <g:if test="${p.class== LinkResource}"><a href="${p.url}">View Full Site</a></g:if>
                    <g:elseif test="${p.class== DocumentResource}">
                        <a href="${p.filePath}" download>Download</a></g:elseif>
                </div>
                </div>
                <hr>
            </g:each>
            <div class="pagination">
                <g:paginate total="${rCount ?: 0}" max="5" maxsteps="3"/>
            </div>
            </g:if>
            <g:if test="${type=='topic'}">
                <g:each in="${tList}" var="p">
                    <div class="row">
                        <div class="col-3">
                            <g:img dir="images" id="profilePhoto"  file="${p.createdBy.photo}" width="60" height="60"/>
                        </div>
                        <div class="col-4">
                            <p>
                                ${p.createdBy.firstName} ${p.createdBy.lastName}
                                <g:link controller="profile" action="index"
                                        params="[userName:p.createdBy.userName]">@${p.createdBy.userName}
                                </g:link>
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
                                    <p><a href="#" onclick="Unsubscribe(${p.id},${session.user.id})">
                                        Unsubscribe</a></p>
                                </g:if>
                                <g:else>
                                    <p><a href="#" onclick="subscribeTopic(${p.id},${session.user.id})">
                                        Subscribe</a></p>
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
        </g:elseif>
        <g:elseif test="${params.controller=='topicShow'}">
            <g:if test="${type=='user'}">
            <g:each in="${uList}" var="p">
                <div class="row">
                    <div class="col-3">
                        <g:img dir="images" id="profilePhoto"  file="${p.user.photo}" width="60" height="60"/>
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
                        <div class="col-3">
                            <g:img dir="images" id="profilePhoto"  file="${p.createdBy.photo}" width="60" height="60"/>
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
                        ${p.description}
                    </div>
                    <div class="row">
                        <div class="col">
                            <g:link controller="viewPost" action="index" params="[name:p.topic.name,id:p.id]">
                                View Post</g:link>
                        </div>
                        <div class="col">
                            <g:if test="${p.class== LinkResource}"><a href="${p.url}">View Full Site</a></g:if>
                            <g:elseif test="${p.class== DocumentResource}">
                                <a href="${p.filePath}" download>Download</a></g:elseif>
                        </div>
                    </div>
                    <hr>
                </g:each>
            </g:if>
        </g:elseif>
        <g:elseif test="${params.controller=='search'}">
            <g:if test="${type=='subscription'}">
                <g:each in="${srList}" var="p">
                    <div class="row">
                        <div class="col-3">
                            <g:img dir="images" id="profilePhoto"  file="${p.topic.createdBy.photo}" width="60" height="60"/>
                        </div>
                        <div class="col-4">
                            <p>
                                ${p.topic.createdBy.firstName} ${p.topic.createdBy.lastName}
                                <g:link controller="profile" action="index"
                                        params="[userName:p.topic.createdBy.userName]">@${p.topic.createdBy.userName}
                                </g:link>
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
                                        <g:select class="form-select" id="visibility_${p.topic.id}"
                                                  name="Visibility_${p.topic.id}" value="${p.topic.visibility}"
                                                  aria-label="Select visibility" from="${Visibility.values()}"
                                                  onclick="editVisibility('${p.topic.id}')">
                                        </g:select>
                                    </div>
                                </g:if>
                            </div>
                        </div>
                    </g:if>
                    <hr>
                </g:each>
                <div class="pagination">
                    <g:paginate total="${srCount ?: 0}" max="5" maxsteps="3"/>
                </div>
            </g:if>
            <g:if test="${type=='post'}">
                <g:each in="${rList}" var="p">
                    <div class="row">
                        <div class="col-3">
                            <g:img dir="images" id="profilePhoto"  file="${p.createdBy.photo}" width="60" height="60"/>
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
                        ${p.description}
                    </div>
                    <div class="row">
                        <div class="col">
                            <g:link controller="viewPost" action="index" params="[name:p.topic.name,
                                                                                  id:p.id]">View Post</g:link>
                        </div>
                        <div class="col">
                            <g:if test="${p.class== LinkResource}"><a href="${p.url}">View Full Site</a></g:if>
                            <g:elseif test="${p.class== DocumentResource}">
                                <a href="${p.filePath}" download>Download</a></g:elseif>
                        </div>
                    </div>
                    <hr>
                </g:each>
                <div class="pagination">
                    <g:paginate total="${rCount ?: 0}" max="5" maxsteps="3"/>
                </div>
            </g:if>
            <g:if test="${type=='topic'}">
                <g:each in="${tList}" var="p">
                    <div class="row">
                        <div class="col-3">
                            <g:img dir="images" id="profilePhoto"  file="${p.createdBy.photo}" width="60" height="60"/>
                        </div>
                        <div class="col-4">
                            <p>
                                ${p.createdBy.firstName} ${p.createdBy.lastName}
                                <g:link controller="profile" action="index"
                                        params="[userName:p.createdBy.userName]">@${p.createdBy.userName}
                                </g:link>
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
                                    <p><a href="#" onclick="Unsubscribe(${p.id},${session.user.id})">
                                        Unsubscribe</a></p>
                                </g:if>
                                <g:else>
                                    <p><a href="#" onclick="subscribeTopic(${p.id},${session.user.id})">
                                        Subscribe</a></p>
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
        </g:elseif>
    </div>
</div>
