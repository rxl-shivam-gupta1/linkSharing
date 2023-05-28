package linksharing

class InviteController {
    InviteService inviteService=new InviteService()

    def index() {
        if(!session.user){redirect(url:'/User')}
        def receiverEmail = params.email
        def topicId = params.topic as Long
        def topicName=Topic.findById(topicId)?.name
        def url="http://localhost:9090/topicShow/index?name=${topicName}"

        flash.message=inviteService.sendInvite(receiverEmail,topicName,url)
        redirect controller:"dashboard",action:"index"
    }
}
