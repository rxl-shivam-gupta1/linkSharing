<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="css/bootstrap.css"/>
        <asset:stylesheet src="style1.css"/>
        <g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <asset:javascript src="js/bootstrap.js"/>
        <div id="create-linkResource" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.linkResource}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.linkResource}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.linkResource}" method="POST">
                <fieldset class="form">
                    <f:field bean="linkResource" property="description"><g:textArea name="description"/></f:field>
                    <f:field bean="linkResource" property="url"/>
                    <div class="hidden">
                        <f:field bean="linkResource" property="createdBy" value="${session.user}"/>
                    </div>
                    <f:field bean="linkResource" property="topic"/>
                </fieldset>
                <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </g:form>
        </div>
    </body>
</html>
