<%@ page import="linksharing.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src="css/bootstrap.css"/>
    <asset:stylesheet src="style1.css"/>
</head>
<body>
<asset:javascript src="js/bootstrap.js"/>
<div id="create-invite" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form controller="invite" method="POST">
        <fieldset class="form">
        <div class="fieldcontain email">
            <label for="emailId">Email<span class="required-indicator">*</span></label>
            <input type="email" id="emailId" name="email" required>
        </div>
        <div class="fieldcontain topic">
            <label for="topic">Topic<span class="required-indicator">*</span></label>
            <g:select from="${Topic.list()}" name="topic" optionKey="id" optionValue="name" id="topic"/>
        </div>
        </fieldset>
        <div>
            <button class="save btn btn-primary" type="submit">Send</button>
        </div>
    </g:form>
</div>
</body>
</html>
