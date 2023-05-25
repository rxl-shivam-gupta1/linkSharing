<%@ page import="linksharing.Topic" %>
<!DOCTYPE html>
<html>
    <head>
        <asset:stylesheet src="css/bootstrap.css"/>
        <asset:stylesheet src="style1.css"/>
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
                    <f:field bean="linkResource" property="topic">
                        <g:select from="${Topic.list()}" name="topic" optionKey="id" optionValue="name"/>
                    </f:field>
                </fieldset>
                <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </g:form>
        </div>
    </body>
</html>
