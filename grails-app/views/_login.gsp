<g:form class="login" controller="login" action="user" method="GET">
	<div class="header">
		<h1>Login</h1>
	</div>
	<div>
	<div class="user">
		<label for="userName">Username:</label>
		<input id="userName" type="text" name="userName" placeholder="Username" required/>
	</div>
	<div class="pass">
		<label for="passWord">Password:</label>
		<input id="passWord" type="password" name="passWord" placeholder="Password" required/>
	</div>
	<div>
		<input type="checkbox"> Remember Me</input>
	</div>
	<div>
		<button class="btn btn-dark" type="submit">Login</button>
		<button class="btn btn-dark" href="#">Forgot your password?</button>
	</div>
	</div>
</g:form>