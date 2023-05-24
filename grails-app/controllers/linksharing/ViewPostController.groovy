package linksharing

class ViewPostController {
    TopicService topicService=new TopicService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        LinkResource link=LinkResource.findByTopic(Topic.findByName(params.topic))
        List topics=topicService.list(max,offset)
        render view:"viewPost",model:[firstName:link.createdBy.firstName,lastName:link.createdBy.lastName,
                                      topicName:link.topic.name,description:link.description,
                                      userName:link.createdBy.userName,topicList:topics,topicCount:Topic.count()]
    }
}
