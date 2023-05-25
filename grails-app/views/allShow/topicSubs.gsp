<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User subscriptions</title>
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
                <table class="table table-striped table-hover" id="subTable" data-table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Created By User</th>
                        <th>Subscribed User</th>
                        <th>dateCreated</th>
                        <th>Seriousness</th>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${subs}" var="sub">
                        <tr>
                            <td id="id_${sub.id}">${sub.id}</td>
                            <td id="subCreated_${sub.id}">${sub.topic.createdBy.userName}</td>
                            <td id="subSubscribed_${sub.id}">${sub.user.userName}</td>
                            <td id="dateCreated_${sub.id}">${sub.dateCreated}</td>
                            <td id="visibility_${sub.id}">${sub.seriousness}</td>
                            <td class="delete_${sub.id}">
                                <a id="deletesub_${sub.id}" href="#"  data-sub-id="${sub.id}"  onclick="deletesub(${sub.id})">
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