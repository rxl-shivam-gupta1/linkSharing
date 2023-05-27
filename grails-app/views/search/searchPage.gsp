<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Search</title>
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
<div class="container">
    <g:render template="/navbar"/>
    <div class="row">
        <div class="col">
            <div class="col">
                <div class="post container">
                    <div class="row">
                        <div class="header">
                            <h3>Trending Topics</h3>
                            <hr>
                        </div>
                        <g:render template="/login/posts" model="[type:'topic',tList:topicList, tCount:topicCount]"/>
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
                            <h3>Search Results</h3>
                            <hr>
                        </div>
                        <g:render template="/login/posts" model="[type:'search',srList:resultList,srCount:resultCount]"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>