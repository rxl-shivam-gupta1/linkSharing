<!DOCTYPE html>
<html>
    <head>
        <title>Topic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:stylesheet src="style1.css"/>
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="css/bootstrap.css"/>
    </head>
    <body>
    <asset:javascript src="js/bootstrap.js"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="dashboard.js"/>
        <div class="container">
            <g:render template="/navbar"/>
            <g:if test="${flash.message}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${flash.message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </g:if>
        <div class="row">
            <div class="col-6">
                <div class="row">
                    <div class="prof container">
                        <div class="row">
                            <g:render template="/topicCard" model="[topic:topic,sub:sub,link:link,doc:doc]"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="post container">
                        <div class="row">
                            <div class="header">
                                <h3>Users: "${topic.name}"</h3>
                                <hr>
                            </div>
                            <div id="post">
                                <g:render template="/login/posts" model="[type:'user',uList:userList,
                                                                          uCount:userCount]"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="col-6">
            <div class="row">
                <div class="post container">
                    <div class="row">
                        <div class="col">
                            <div class="header">
                                <h3>Posts: "${topic.name}"</h3>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group has-search">
                                <span class="form-control-feedback"><asset:image src="search.png"/></span>
                                <input class="form-control" type="search" placeholder="Search" aria-label="Search"/>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <g:render template="/login/posts" model="[type:'post',rList:resList,rCount:resCount]"/>
                </div>
            </div>
            </div>
        </div>
        </div>
    </body>
</html>
