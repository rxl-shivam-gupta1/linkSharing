<button type="button" class="btn" data-toggle="modal" data-target="#modal_${topicId}">
    <div>
        <asset:image src="mail.png"/>
    </div>
</button>

<div class="modal fade" id="modal_${topicId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Send Invite</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                    <g:include view="invite/create.gsp" model="[topicId:topicId]"/>
            </div>
        </div>
    </div>
</div>