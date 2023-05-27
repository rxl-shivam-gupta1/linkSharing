<%@ page import="linksharing.Topic" %>
<!DOCTYPE html>
<html>
    <head>
        <asset:stylesheet src="css/bootstrap.css"/>
        <asset:stylesheet src="style1.css"/>
    </head>
    <body>
    <asset:javascript src="js/bootstrap.js"/>
        <div id="create-documentResource" class="content scaffold-create" role="main">
        <g:uploadForm controller="documentResource" action="create">
            <fieldset class="form">
            <div class="fieldcontain">
                <label for="documentDescription">Description</label>
                <textarea id="documentDescription" name="documentDescription" required></textarea>
            </div>
                <div class="fieldcontain">
                    <div class="custom-file">
                        <label for="documentResource">Document</label>
                        <input type="file"  id="documentResource" name="documentResource" required>
                    </div>
                </div>
            <div class="hidden">
                <input name="userId" type="text" value="${user.id}"/>
            </div>
            <div class="fieldcontain">
                <label for="documentTopic">Topic</label>
                <g:select name="documentTopic" id="documentTopic" from="${Topic.list()}" optionValue="${{topic -> topic.name}}" optionKey="${{topic -> topic.id}}" required="true"/>
            </div>
            </fieldset>
            <g:submitButton id="shareDocument" name="Share" class="btn btn-primary">Share</g:submitButton>
        </g:uploadForm>
        </div>
    </body>
</html>
