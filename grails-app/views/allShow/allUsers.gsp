<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>All Users</title>
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
        <div class="table-responsive">
            <table class="table table-striped table-hover" id="userTable" data-table>
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Active</th>
                    <th>Manage</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${users}" var="user">
                    <tr>
                        <td id="id_${user.id}">${user.id}</td>
                        <td id="userName_${user.id}">${user.userName}</td>
                        <td id="email_${user.id}">${user.email}</td>
                        <td id="firstName_${user.id}">${user.firstName}</td>
                        <td id="lastName_${user.id}">${user.lastName}</td>
                        <td id="isActive_${user.id}">${user.active}</td>
                        <td class="activate-deactivate_${user.id}">
                            <button class="button btn-underline" id="activate-deactivate_${user.id}" data-user-id="${user.id}"
                                    data-isActive="${user.active}" onclick="editUserStance(${user.id}, ${user.active})">
                                ${user.active ? 'Deactivate' : 'Activate'}
                            </button>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>