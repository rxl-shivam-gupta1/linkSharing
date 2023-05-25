<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Home Page</title>
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
<asset:javascript src="myJQuery.js"/>
<div class="container">
    <g:render template="/navbar"/>
    <div class="row-cols-2">
    <div class="post container">
        <div class="header">
            <h3>Change Password</h3>
            <hr>
        </div>
        <g:render template="/changePass"/>
    </div>
    </div>
</div>
</body>
</html>
