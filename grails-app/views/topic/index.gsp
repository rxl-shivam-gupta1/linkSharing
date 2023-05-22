<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-topic" class="content scaffold-list" role="main">
            <g:each in="${topicList}" var="p">
                <div class="row">
                <div class="col-6">
                    <p>${p.createdBy.firstName} ${p.createdBy.lastName} @${p.createdBy.userName}</p>
                </div>
                <div class="topicName col">
                    <p>${p.name}</p>
                </div>
                </div>
                <hr>
            </g:each>
            <div class="pagination">
                <g:paginate total="${topicCount}"/>
            </div>
        </div>
    </body>
</html>