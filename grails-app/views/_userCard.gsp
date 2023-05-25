
    <div class="row">
        <div class="col-4">
            <asset:image src="user (1).png"/>
        </div>
        <div class="col">
            <div class="row">
                <h4>${first} ${last}</h4>
            </div>
            <div class="row">
                <h5>@${userName}</h5>
            </div>
            <div class="row">
                <div class="col">
                    <p>Topics:<g:link controller="allShow" action="userTopics">${topic.size}</g:link></p>
                </div>
                <div class="col">
                    <p>Subscriptions:<g:link controller="allShow" action="userSubs">${sub.size}</g:link></p>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <g:if test="${session.user.userName==userName && params.controller=='profile'}">
                        <g:link controller="editProfile" action="index">Edit Profile</g:link>
                    </g:if>
                </div>
            </div>
        </div>
    </div>