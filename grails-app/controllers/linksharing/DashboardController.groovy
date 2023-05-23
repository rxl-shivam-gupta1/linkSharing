package linksharing

class DashboardController {
    SubscriptionService subscriptionService=new SubscriptionService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List subs=subscriptionService.list(max,offset,session.user)
        if(request.xhr)
            render template:"/login/posts",model:[tList:subs,tCount:subscriptionService.count()]
        else
            render view:"dashboard",model:[first:session.user.firstName,last:session.user.lastName,
                                       name:session.user.userName,topic:Topic.findAllByCreatedBy(session.user),
                                       sub:Subscription.findAllByUser(session.user),subList:subs,
                                       subCount:subscriptionService.count()]
    }
}
