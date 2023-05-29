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

    def subscription(){
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List subs=subscriptionService.list(max,offset,session.user)
        render template:"/login/posts",model:[type:"subscription",sList:subs,sCount:subscriptionService.count()]
    }

    def trendingTopic(){
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List topics=topicService.list(max,offset)
        render template:"/login/posts",model:[type:"topic",tList:topics,tCount:Topic.count()]
    }

    def inbox(){
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List reading=readingItemService.notReadList(max,offset,session.user)
        render template:"/login/posts",model:[type:"inbox",iList:reading,iCount:ReadingItem.count()]
    }

    def card(){
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List reading=readingItemService.notReadList(max,offset,session.user)
        render template:"/userCard",model:[first:session.user.firstName,last:session.user.lastName,
                                           userName:session.user.userName,topic:Topic.findAllByCreatedBy(session.user),
                                           sub:Subscription.findAllByUser(session.user)]
    }
}
