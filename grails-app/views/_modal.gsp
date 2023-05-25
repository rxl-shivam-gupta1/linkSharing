<button type="button" class="btn" data-toggle="modal" data-target="#${controller}Modal">
    <div>
        <g:if test="${controller=="topic"}">
            <asset:image src="speech-bubble.png"/>
        </g:if>
        <g:elseif test="${controller=="invite"}">
            <asset:image src="email.png"/>
        </g:elseif>
        <g:elseif test="${controller=="linkResource"}">
            <asset:image src="link.png"/>
        </g:elseif>
        <g:elseif test="${controller=="documentResource"}">
            <asset:image src="add-file.png"/>
        </g:elseif>
        <g:elseif test="${controller=='dashboard'}">
            <asset:image src="mail.png"/>
        </g:elseif>
    </div>
</button>

<div class="modal fade" id="${controller}Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <g:if test="${controller=="topic"}">
                    <h5 class="modal-title" id="exampleModalLabel">Create Topic</h5>
                </g:if>
                <g:elseif test="${controller=="invite" || controller=="dashboard"}">
                    <h5 class="modal-title" id="exampleModalLabel">Send Invite</h5>
                </g:elseif>
                <g:elseif test="${controller=="linkResource"}">
                    <h5 class="modal-title" id="exampleModalLabel">Add Link</h5>
                </g:elseif>
                <g:elseif test="${controller=="documentResource"}">
                    <h5 class="modal-title" id="exampleModalLabel">Add Document</h5>
                </g:elseif>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:if test="${controller=="topic"}">
                    <g:include view="topic/create"/>
                </g:if>
                <g:elseif test="${controller=="invite" || controller=="dashboard"}">
                    <g:include view="invite/create.gsp"/>
                </g:elseif>
                <g:elseif test="${controller=="linkResource"}">
                    <g:include view="linkResource/create"/>
                </g:elseif>
                <g:elseif test="${controller=="documentResource"}">
                    <g:include view="documentResource/create"/>
                </g:elseif>
            </div>
        </div>
    </div>
</div>