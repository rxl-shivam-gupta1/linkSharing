<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="style1.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="css/bootstrap.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
    <asset:javascript src="js/bootstrap.js"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="dashboard.js"/>
    <asset:javascript src="myJQuery.js"/>
    <div class="container">
        <g:render template="/navbar"/>
        <g:if test="${flash.message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${flash.message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </g:if>
        <div class="row">
            <div class="prof col">
        	    <div class="container">
        	        <g:render template="/userCard" model="[first:first,last:last,userName:name,topic:topic,sub:sub]"/>
                </div>
            </div>
            <div class="col-6">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Inbox</h3>
                            <hr>
                        </div>
                        <g:render template="/login/posts"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Subscriptions</h3>
                            <hr>
                        </div>
                        <div id="post">
                        <g:render template="/login/posts" model="[tList:subList, tCount:subCount]"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Trending Topics</h3>
                            <hr>
                        </div>
                        <g:render template="/login/posts"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
