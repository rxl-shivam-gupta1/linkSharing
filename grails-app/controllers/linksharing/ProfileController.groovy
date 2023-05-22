package linksharing

class ProfileController {
    SubscriptionService subscriptionService=new SubscriptionService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        User user=User.findByUserName(params.userName)
        if(session.user) {
            List subs=subscriptionService.list(max,offset,session.user)
            render view:"profile",model:[first:session.user.firstName,last:session.user.lastName,
                                         userName:session.user.userName,topic:Topic.findAllByCreatedBy(session.user),
                                         sub:Subscription.findAllByUser(session.user),subList:subs,
                                         subCount:subscriptionService.count()]
        } else {
            List subs=subscriptionService.list(max,offset,user)
            render view:"profile",model:[first:params.firstName,last:params.lastName,
                                         userName:params.userName,topic:Topic.findAllByCreatedBy(user),
                                         sub:Subscription.findAllByUser(user),subList:subs,
                                         subCount:subscriptionService.count()]
        }
    }
}
