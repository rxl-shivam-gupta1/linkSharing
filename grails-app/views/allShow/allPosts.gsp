<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>All posts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="style1.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<asset:javascript src="bootstrap.js"/>
<asset:javascript src="application.js"/>
<asset:javascript src="jquery-3.3.1.min.js"/>
<asset:javascript src="admin.js"/>
<div class="container">
    <g:render template="/navbar"/>
    <div class="container-fluid">
        <div class="row">
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="postTable" data-table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Topic Name</th>
                        <th>Created By</th>
                        <th>dateCreated</th>
                        <th>lastUpdated</th>
                        <th>Description</th>
                        <g:if test="${params.action=='allLinks'}">
                            <th>URL</th>
                        </g:if>
                        <g:else>
                            <th>File Path</th>
                        </g:else>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${posts}" var="post">
                        <tr>
                            <td id="id_${post.id}">${post.id}</td>
                            <td id="postName_${post.id}">${post.topic.name}</td>
                            <td id="createdBy_${post.id}"><a href="/profile/index?userName=${post.createdBy.userName}">@${post.createdBy.userName}</a></td>
                            <td id="dateCreated_${post.id}">${post.dateCreated}</td>
                            <td id="lastUpdated_${post.id}">${post.lastUpdated}</td>
                            <td id="description_${post.id}">${post.description}</td>
                            <g:if test="${params.action=='allLinks'}">
                                <td id="url_${post.id}">${post.url}</td>
                            </g:if>
                            <g:else>
                                <td id="filepath_${post.id}">${post.filePath}</td>
                            </g:else>
                            <td class="delete_${post.id}">
                                <a id="deletepost_${post.id}" href="#"  data-post-id="${post.id}"  onclick="deletepost(${post.id})">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>