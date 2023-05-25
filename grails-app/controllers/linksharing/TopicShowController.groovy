package linksharing

class TopicShowController {
    SubscriptionService subscriptionService=new SubscriptionService()
    LinkResourceService linkResourceService=new LinkResourceService()
    DocumentResourceService docResourceService=new DocumentResourceService()

    def index() {
        Topic topic=Topic.findByName(params.name)
        List subs=subscriptionService.topicList(topic.name)
        List links=linkResourceService.resList(topic.name)
        List docs=docResourceService.resList(topic.name)
        List res=links+docs
        render view:"/topic/show",model:[topic:topic,sub:subs,link:links,doc:docs,
                                         userList:subs,userCount:subs.size(),resList:res,resCount:res.size()]
    }
}
