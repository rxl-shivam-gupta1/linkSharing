package linksharing

class SearchController {
    SearchService searchService=new SearchService()
    LinkResourceService linkResourceService=new LinkResourceService()
    DocumentResourceService documentResourceService=new DocumentResourceService()
    TopicService topicService=new TopicService()

    def searchTopic(){
        List res=LinkResource.list()+DocumentResource.list()
        List topics=Topic.list()
        List result= searchService.searchData(params,session.user) as List
        if(session.user){
            User user=User.findByUserName(session.user.userName)
            render view:'searchPage',model:[first:user.firstName,last:user.lastName,
                                            userName:user.userName,topic:Topic.findAllByCreatedBy(user),
                                            sub:Subscription.findAllByUser(user),resList:res,resCount:res.size(),
                                            topicList:topics,topicCount:Topic.count(),resultList:result]
        }else{
            flash.warn="Apologies but please login to search"
            redirect controller:"login",action:"index"
        }
    }
}
