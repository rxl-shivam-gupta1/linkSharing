package linksharing

class DashboardController {
    SubscriptionService subscriptionService=new SubscriptionService()
    TopicService topicService=new TopicService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List subs=subscriptionService.list(max,offset,session.user)
        List topics=topicService.list(max,offset)
        render view:"dashboard",model:[first:session.user.firstName,last:session.user.lastName,
                                       name:session.user.userName,topic:Topic.findAllByCreatedBy(session.user),
                                       sub:Subscription.findAllByUser(session.user),subList:subs,
                                       subCount:subscriptionService.count(),
                                       topicList:topics,topicCount:Topic.count()]
    }
}
