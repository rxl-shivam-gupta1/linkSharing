<g:form class="changePass" controller="editProfile" action="changePass">
    <g:if test="${params.controller!='editProfile'}">
    <div class="user">
        <label for="userName">Username<span class="required-indicator">*</span></label>
        <input id="userName" type="text" name="userName" placeholder="Username" required/>
    </div>
    </g:if>
    <div class="newPass">
        <label for="newPass">New Password<span class="required-indicator">*</span></label>
        <input type="password" id="newPass" placeholder="New Password" name="newPass" required>
    </div>
    <div class="confirmPass">
        <label for="confirmPass">Confirm Password<span class="required-indicator">*</span></label>
        <input type="text" id="confirmPass" placeholder="Confirm Password" name="confirmPass" required>
    </div>
    <div>
        <button class="btn btn-dark" type="submit">Update</button>
    </div>
</g:form>