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
            <div class="form-group">
                <label>Document</label>
                <div class="custom-file">
                    <input type="file"  id="documentResource" name="documentResource" required>
                </div>
            </div><div id="documentResourceErrorMessage" style="display: none; color: red;"></div>
            <div class="form-group">
                <label >Description</label>
                <textarea class="form-control" id="documentDescription" name="documentDescription" rows="3" required></textarea>
            </div><div id="documentDescriptionErrorMessage" style="display: none; color: red;"></div>
            <div class="hidden">
                <input name="userId" type="text" value="${user.id}"/>
            </div>
            <div class="form-group">
                <label >Topic</label>
                <g:select name="documentTopic" id="documentTopic" from="${Topic.list()}" optionValue="${{topic -> topic.name}}" optionKey="${{topic -> topic.id}}" required="true" class="form-control"/>
            </div>
            <g:submitButton id="shareDocument" name="Share" class="btn btn-primary">Share</g:submitButton>
        </g:uploadForm>
        </div>
    </body>
</html>
