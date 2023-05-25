<!DOCTYPE html>
<html>
    <head>
        <asset:stylesheet src="css/bootstrap.css"/>
        <asset:stylesheet src="style1.css"/>
    </head>
    <body>
    <asset:javascript src="js/bootstrap.js"/>
        <div id="create-topic" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.topic}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.topic}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form resource="${this.topic}" method="POST">
                <fieldset class="form">
                    <f:field bean="topic" property="name"/>
                    <f:field bean="topic" property="visibility"/>
                    <div class="hidden">
                        <f:field bean="topic" property="createdBy" value="${session.user}"/>
                    </div>
                </fieldset>
                <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </g:form>
        </div>
    </body>
</html>
