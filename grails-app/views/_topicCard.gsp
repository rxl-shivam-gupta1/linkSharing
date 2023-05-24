<div class="row">
    <div class="col-4">
        <asset:image src="user (1).png"/>
    </div>
    <div class="col">
        <div class="row">
            <h4>${name} (${visibility})</h4>
        </div>
        <div class="row">
            <h5>@${userName}</h5>
        </div>
        <div class="row">
            <div class="col">
                <p>Subscriptions:<g:link controller="allShow" action="topicSubs" params="[name:name]">${sub.size}</g:link></p>
            </div>
            <div class="col">
                <p>Posts:${link.size+doc.size}</p>
            </div>
        </div>
    </div>
</div>