<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="style1.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="css/bootstrap.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<asset:javascript src="js/bootstrap.js"/>
<asset:javascript src="application.js"/>
<asset:javascript src="jquery-3.3.1.min.js"/>
<asset:javascript src="myJQuery.js"/>
<div class="container">
    <g:render template="/navbar"/>
    <g:if test="${flash.message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${flash.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </g:if>
    <g:elseif test="${flash.warn}">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            ${flash.warn}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </g:elseif>
    <div class="row">
        <div class="col-6">
            <div class="row">
                <div class="post container">
                    <div class="header">
                        <h3>User Details</h3>
                        <hr>
                    </div>
                    <g:form class="editDetails" controller="editProfile" action="editDetails">
                        <div>
                            <div class="first">
            	                <label for="firstName">First Name<span class="required-indicator">*</span></label>
                                <input id="firstName" type="text" name="firstName" placeholder="First Name"
                                       value="${session.user.firstName}" required>
            	            </div>
                            <div class="last">
                                <label for="lastname">Last Name<span class="required-indicator">*</span></label>
                                <input id="lastname" type="text" name="lastName" placeholder="Last Name"
                                       value="${session.user.lastName}" required>
                            </div>
                            <div class="emailid">
                                <label for="email">Email ID<span class="required-indicator">*</span></label>
                                <input id="email" type="email" name="email" placeholder="Enter Email ID"
                                       value="${session.user.email}" required>
                            </div>
                            <div class="user">
                                <label for="userName">User Name<span class="required-indicator">*</span></label>
                                <input id="userName" type="text" name="userName" placeholder="User Name"
                                       value="${session.user.userName}" required>
                            </div>
                            <div class="image">
                                <label for="image-upload">Photo</label>
                                <input type="file" id="image-upload" name="photo" value="${session.user.photo}"
                                       accept="image/*">
                            </div>
                            <div>
                                <button class="btn btn-dark" type="submit">Update</button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="row">
                <div class="post container">
                    <div class="header">
                        <h3>Change Password</h3>
                        <hr>
                    </div>
                <g:render template="/changePass"/>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>