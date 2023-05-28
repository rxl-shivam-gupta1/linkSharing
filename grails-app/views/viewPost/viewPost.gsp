<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>View Post</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="style1.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="css/bootstrap.css"/>
</head>
<body>
<asset:javascript src="js/bootstrap.js"/>
<asset:javascript src="application.js"/>
<asset:javascript src="dashboard.js"/>
<asset:javascript src="admin.js"/>
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
                        <g:if test="${link}">
                            <g:render template="/postLink" model="[link:link, ratingScore:ratingScore]"/>
                        </g:if>
                        <g:elseif test="${doc}">
                            <g:render template="/postDoc" model="[doc:doc, ratingScore:ratingScore]"/>
                        </g:elseif>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6">
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