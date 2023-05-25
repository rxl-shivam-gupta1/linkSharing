<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Topics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="style1.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="css/bootstrap.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<asset:javascript src="js/bootstrap.js"/>
<asset:javascript src="application.js"/>
<asset:javascript src="jquery-3.3.1.min.js"/>
<asset:javascript src="admin.js"/>
<div class="container">
    <g:render template="/navbar"/>
    <div class="container-fluid">
        <div class="row">
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="topicTable" data-table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>dateCreated</th>
                        <th>lastUpdated</th>
                        <th>visibility</th>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${topics}" var="topic">
                        <tr>
                            <td id="id_${topic.id}">${topic.id}</td>
                            <td id="topicName_${topic.id}">${topic.name}</td>
                            <td id="dateCreated_${topic.id}">${topic.dateCreated}</td>
                            <td id="lastUpdated_${topic.id}">${topic.lastUpdated}</td>
                            <td id="visibility_${topic.id}">${topic.visibility}</td>
                            <td class="delete_${topic.id}">
                                <a id="deleteTopic_${topic.id}" href="#"  data-topic-id="${topic.id}"  onclick="deleteTopic(${topic.id})">
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