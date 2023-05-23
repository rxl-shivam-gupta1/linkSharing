package linksharing

class ProfileController {
    SubscriptionService subscriptionService=new SubscriptionService()
    LinkResourceService linkResourceService=new LinkResourceService()
    DocumentResourceService documentResourceService=new DocumentResourceService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        User user=User.findByUserName(params.userName)
        List subs=subscriptionService.list(max,offset,user)
        List res=linkResourceService.list(max,offset,user)+documentResourceService.list(max,offset,user)
        render view:"profile",model:[first:user.firstName,last:user.lastName,
                                     userName:user.userName,topic:Topic.findAllByCreatedBy(user),
                                     sub:Subscription.findAllByUser(user),subList:subs,
                                     subCount:subscriptionService.count(),resList:res,resCount:res.size()]

    }
}
