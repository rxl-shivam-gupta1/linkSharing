<!DOCTYPE html>
<html>
    <body>
        <div id="create-user" class="scaffold-create" role="main">
            <g:hasErrors bean="${this.user}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form class="register" resource="${this.user}" method="POST">
                <div class="header">
                    <h1>Register</h1>
                </div>
                <div>
               	    <div class="first">
            	        <label for="firstName">First Name<span class="required-indicator">*</span></label>
            		    <input id="firstName" type="text" name="firstName" placeholder="First Name" required>
            	    </div>
            	    <div class="last">
            		    <label for="lastname">Last Name<span class="required-indicator">*</span></label>
            		    <input id="lastname" type="text" name="lastName" placeholder="Last Name" required>
            	    </div>
            	    <div class="emailid">
            		    <label for="email">Email ID<span class="required-indicator">*</span></label>
            		    <input id="email" type="email" name="email" placeholder="Enter Email ID" required>
            	    </div>
            	    <div class="user">
            	        <label for="userName">User Name<span class="required-indicator">*</span></label>
            	   	    <input id="userName" type="text" name="userName" placeholder="User Name" required>
            	    </div>
            	    <div class="pass">
            	        <label for="passWord">Password<span class="required-indicator">*</span></label>
            		    <input id="passWord" type="password" name="passWord" placeholder="Password" required>
            	    </div>
            	    <div class="confirmpass">
            		    <label for="confirm">Confirm Password<span class="required-indicator">*</span></label>
            		    <input id="confirm" type="password" placeholder="Confirm Password" name="confirm" required>
            	    </div>
            	    <div class="image">
            		    <label for="image-upload">Photo</label>
            		    <input type="file" id="image-upload" name="photo" accept="image/*">
            	    </div>
            	    <div>
            		    <g:submitButton class="btn btn-dark" name="submit" value="Register"/>
            	    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
