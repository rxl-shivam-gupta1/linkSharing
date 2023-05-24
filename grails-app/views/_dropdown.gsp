<div class="dropdown">
    <button class="btn btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
        <asset:image src="user.png"/>
    </button>
    <g:if test="${session.user.admin==false}">
        <ul class="dropdown-menu">
            <li><g:link class="dropdown-item" controller="profile" params="[userName:session.user.userName]">Profile</g:link></li>
            <li><hr class="dropdown-divider"></li>
            <li><g:link class="dropdown-item" controller="logout">Logout</g:link></li>
        </ul>
    </g:if>
    <g:else>
    <ul class="dropdown-menu">
        <li><g:link class="dropdown-item" controller="profile" params="[userName:session.user.userName]">Profile</g:link></li>
        <li><hr class="dropdown-divider"></li>
        <li><g:link class="dropdown-item" controller="allShow" action="allUsers">Users</g:link></li>
        <li><hr class="dropdown-divider"></li>
        <li><g:link class="dropdown-item" controller="allShow" action="allTopics">Topics</g:link></li>
        <li><hr class="dropdown-divider"></li>
        <li class="dropdown-submenu">
                <a class="dropdown-item" tabindex="-1" href="#">Posts</a>
                <ul class="dropdown-menu">
                    <li><g:link class="dropdown-item" controller="allShow" action="allLinks">Links</g:link></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><g:link class="dropdown-item" controller="allShow" action="allDocs">Documents</g:link></li>
                </ul>
        </li>
        <li><hr class="dropdown-divider"></li>
        <li><g:link class="dropdown-item" controller="logout">Logout</g:link></li>
    </ul>
    </g:else>
</div>