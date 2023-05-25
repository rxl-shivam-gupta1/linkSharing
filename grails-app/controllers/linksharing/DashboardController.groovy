package linksharing

class DashboardController {
    SubscriptionService subscriptionService=new SubscriptionService()
    TopicService topicService=new TopicService()
    ReadingItemService readingItemService=new ReadingItemService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List subs=subscriptionService.list(max,offset,session.user)
        List topics=topicService.list(max,offset)
        List reading=readingItemService.notReadList(max,offset,session.user)
        render view:"dashboard",model:[first:session.user.firstName,last:session.user.lastName,
                                       name:session.user.userName,topic:Topic.findAllByCreatedBy(session.user),
                                       sub:Subscription.findAllByUser(session.user),subList:subs,
                                       subCount:subscriptionService.count(),
                                       topicList:topics,topicCount:Topic.count(),inboxList:reading,
                                       inboxCount:ReadingItem.count()]
    }
}
