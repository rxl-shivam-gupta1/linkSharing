<html>
<head>
    <title>User Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="style1.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="css/bootstrap.css"/>
</head>
<body>
<asset:javascript src="js/bootstrap.js"/>
<asset:javascript src="application.js"/>
<asset:javascript src="myJQuery.js"/>
<asset:javascript src="inputValidation.js"/>
<asset:javascript src="profile.js"/>
<div class="container">
    <g:render template="/navbar"/>
    <div class="row">
    <div class="col">
        <div class="col">
            <div class="prof container" id="userCard">
                <g:render template="/userCard" model="[first:first,last:last,userName:userName,topic:topic,sub:sub]"/>
            </div>
        </div>
        <div class="col">
            <div class="post container">
                <div class="row">
                    <div class="header">
                        <h3>Subscriptions</h3>
                        <hr>
                    </div>
                    <g:render template="/login/posts" model="[type:'subscription',sList:subList, sCount:subCount]"/>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="row">
            <div class="post container">
                <div class="row">
                    <div class="col">
                        <div class="header">
                            <h3>Posts</h3>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group has-search">
                            <span class="form-control-feedback"><asset:image src="search.png"/></span>
                            <input class="form-control" type="search" placeholder="Search" aria-label="Search"/>
                        </div>
                    </div>
                    <hr>
                    <g:render template="/login/posts" model="[type:'post',rList:resList, rCount:resCount]"/>
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
                    <g:render template="/login/posts" model="[type:'topic',tList:topicList,tCount:topicCount]"/>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>