<div class="row">
    <div class="col-4">
        <asset:image src="user (1).png"/>
    </div>
    <div class="col">
        <div class="row">
            <div class="col">
            <h4>${firstName} ${lastName}</h4>
            </div>
            <div class="col">
                <h4>${topicName}</h4>
            </div>
        </div>
        <div class="row">
            <div class="col">
            <h5>@${userName}</h5>
            </div>
            <div class="col">
                <g:include view="/resourceRating/create.gsp"/>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <p>${description}</p>
</div>