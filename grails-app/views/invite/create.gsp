<%@ page import="linksharing.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src="css/bootstrap.css"/>
    <asset:stylesheet src="style1.css"/>
</head>
<body>
<asset:javascript src="js/bootstrap.js"/>
<div id="create-invite" class="content scaffold-create" role="main">
    <g:form controller="invite">
        <fieldset class="form">
        <div class="fieldcontain email">
            <label for="emailId">Email<span class="required-indicator">*</span></label>
            <input type="email" id="emailId" name="email" required>
        </div>
        <div class="fieldcontain topic">
            <g:if test="${params.function=='invite'}">
            <label for="topic">Topic<span class="required-indicator">*</span></label>
            <g:select from="${Topic.list()}" name="topic" optionKey="id" optionValue="name" id="topic"/>
        </g:if>
            <g:else>
                <label>Topic<span class="required-indicator">*</span></label>
                <input type="text" id="topic" value="${Topic.findById(topicId as Long).name}" disabled="disabled">
                <input type="text" name="topic" id="topicHidden" value="${topicId}" hidden="hidden">
            </g:else>
        </div>
        </fieldset>
        <div>
            <g:actionSubmit value="Send" action="index" class="btn btn-primary"/>
        </div>
    </g:form>
</div>
</body>
</html>
