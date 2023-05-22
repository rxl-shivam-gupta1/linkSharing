<div class="dropdown">
    <button class="btn btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
        <asset:image src="user.png"/>
    </button>
    <g:if test="${params.controller=='profile'}">
        <ul class="dropdown-menu">
            <li><g:link class="dropdown-item" controller="profile">Profile</g:link></li>
            <li><hr class="dropdown-divider"></li>
            <li><g:link class="dropdown-item" controller="logout">Logout</g:link></li>
        </ul>
    </g:if>
    <g:elseif test="${session.user}">
    <ul class="dropdown-menu">
        <li><g:link class="dropdown-item" controller="profile">Profile</g:link></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">Users</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">Topics</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">Posts</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><g:link class="dropdown-item" controller="logout">Logout</g:link></li>
    </ul>
    </g:elseif>
</div>