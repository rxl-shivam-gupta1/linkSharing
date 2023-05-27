<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
	<div class="container">
		<div class="col">
			<g:if test="${session.user}">
				<g:link class="navbar-brand" controller="dashboard" action="index">LinkSharing</g:link>
			</g:if>
			<g:else>
   				<g:link class="navbar-brand" controller="login" action="index">LinkSharing</g:link>
			</g:else>
   		</div>
   		<div class="col">
   			<div class="form-group has-search">
				<g:form class="d-flex" role="search" controller="search" action="searchTopic">
					<input class="form-control me-2" type="search" name="query" id="query" placeholder="Search"
						   aria-label="Search" onclick="textLimit('query')">
					<button class="btn btn-light" name="search" id="search" type="submit">
						<asset:image src="search.png"/></button>
				</g:form>
			</div>
   	    </div>
		<g:if test="${(params.controller=='profile' || params.controller=='allShow' ||
				params.controller=='editProfile') && session.user}">
			<g:render template="/dropdown"/>
		</g:if>
		<g:elseif test="${(params.controller=='topicShow' || params.controller=='viewPost' || params.controller=='search') && session.user}">
			<g:render template="/modal" model="[controller:'linkResource',action:'create']"/>
			<g:render template="/modal" model="[controller:'documentResource',action:'create']"/>
			<g:render template="/dropdown"/>
		</g:elseif>
		<g:elseif test="${session.user}">
			<g:render template="/modal" model="[controller:'topic',action:'create']"/>
			<g:render template="/modal" model="[controller:'invite',action:'create']"/>
			<g:render template="/modal" model="[controller:'linkResource',action:'create']"/>
			<g:render template="/modal" model="[controller:'documentResource',action:'create']"/>
			<g:render template="/dropdown"/>
		</g:elseif>
	</div>
</nav>