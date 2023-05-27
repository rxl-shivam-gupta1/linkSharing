<!DOCTYPE html>
<html>
    <head>
        <asset:stylesheet src="css/bootstrap.css"/>
        <asset:stylesheet src="style1.css"/>
    </head>
    <body>
    <asset:javascript src="js/bootstrap.js"/>
        <div id="create-topic" class="content scaffold-create" role="main">
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
