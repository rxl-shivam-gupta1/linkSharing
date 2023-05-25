<g:form class="login" controller="login">
	<div class="header">
		<h1>Login</h1>
	</div>
	<div>
	<div class="user">
		<label for="userName">Username<span class="required-indicator">*</span></label>
		<input id="userName" type="text" name="userName" placeholder="Username"/>
	</div>
	<div class="pass">
		<label for="passWord">Password<span class="required-indicator">*</span></label>
		<input id="passWord" type="password" name="passWord" placeholder="Password"/>
	</div>
	<div>
		<g:actionSubmit class="btn btn-dark" value="Login" action="user"/>
		<g:actionSubmit class="btn btn-dark" value="Forgot your Password?" action="forgotPass"/>
	</div>
	</div>
</g:form>