<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
	<div class="container">
		<div class="col">
   			<g:link class="navbar-brand" controller="login" action="index">LinkSharing</g:link>
   		</div>
   		<div class="col">
   			<div class="form-group has-search">
   				<span class="fa fa-search form-control-feedback"></span>
   				<input class="form-control" type="search" placeholder="Search" aria-label="Search"/>
			</div>
   	    </div>
		<g:if test="${params.controller=='profile' && session.user}">
			<g:render template="/dropdown"/>
		</g:if>
		<g:elseif test="${session.user}">
			<g:render template="/modal" model="[controller:'topic',action:'create']"/>
			<g:render template="/modal" model="[controller:'invite',action:'create']"/>
			<g:render template="/modal" model="[controller:'linkResource',action:'create']"/>
			<g:render template="/modal" model="[controller:'documentResource',action:'create']"/>
			<g:render template="/dropdown"/>
		</g:elseif>
	</div>
</nav>