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
    <div class="container">
        <g:render template="/navbar"/>
        <div class="row">
            <div class="prof col-5">
        	    <div class="row">
        	        <div class="col-4">
                        <asset:image src="user (1).png"/>
                    </div>
                    <div class="col">
                        <div class="row">
                            <h4>${first} ${last}</h4>
                        </div>
                        <div class="row">
                            <h5>@${name}</h5>
                        </div>
                        <div class="row">
                            <div class="col">
                                <p>Topics:${topic.size}</p>
                            </div>
                            <div class="col">
                                <p>Subscriptions:${sub.size}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Inbox</h3>
                            <hr>
                        </div>
                        <g:render template="/posts"/>
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
                        <g:render template="/posts" model="[tList:subList,tCount:subCount]"/>
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
                        <g:render template="/posts"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
