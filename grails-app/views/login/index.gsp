<!doctype html>
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
    <div class="container">
		<g:render template="/navbar"/>
		<g:if test="${flash.message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${flash.message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </g:if>
        <g:elseif test="${flash.warn}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                ${flash.warn}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </g:elseif>
  		<div class="row">
  			<div class="col-7">
  			<div class="post container">
                <div class="header">
                    <h3>Recent posts</h3>
                    <hr>
                </div>
                <g:render template="/posts" model="[tList:topicList,tCount:topicCount]"/>
  			</div>
  			</div>
  			<div class="col">
    			<g:render template="/login" />
    		</div>
    	</div>
    	<br>
    	<div class="row">
  			<div class="col-7">
  			<div class="post container">
                <div class="header">
                    <h3>Trending posts</h3>
                    <hr>
                </div>
                    <g:render template="/posts"/>
              	</div>
  			</div>
    		<div class="col">
    			<g:include view="user/create" />
    		</div>
    		</div>
    	</div>
	</div>
</body>
</html>
