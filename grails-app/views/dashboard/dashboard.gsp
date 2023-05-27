<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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
            <div class="col">
            <div class="row">
        	    <div class="prof container">
        	        <g:render template="/userCard" model="[first:first,last:last,userName:name,topic:topic,
                                                           sub:sub]"/>
                </div>
            </div>
            <div class="row">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Subscriptions</h3>
                            <hr>
                        </div>
                        <div id="post">
                            <g:render template="/login/posts" model="[type:'subscription',sList:subList,
                                                                      sCount:subCount]"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="row">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Inbox</h3>
                            <hr>
                        </div>
                        <g:render template="/login/posts" model="[type:'inbox',iList:inboxList,
                                                                  iCount:inboxCount]"/>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Trending Topics</h3>
                            <hr>
                        </div>
                        <g:render template="/login/posts" model="[type:'topic',tList:topicList,
                                                                  tCount:topicCount]"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
