package linksharing

class ViewPostController {
    TopicService topicService=new TopicService()
    ResourceRatingService resourceRatingService=new ResourceRatingService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        LinkResource link=LinkResource.findByTopicAndId(Topic.findByName(params.name),params.id)
        DocumentResource doc=DocumentResource.findByTopicAndId(Topic.findByName(params.name),params.id)
        List topics=topicService.list(max,offset)
        ResourceRating rating=new ResourceRating()
        if(link)
            rating=ResourceRating.findByResourceAndUser(link,session.user)
        else if(doc)
            rating=ResourceRating.findByResourceAndUser(doc,session.user)
        Integer ratingScore
        if(rating)
            ratingScore=rating.score
        else
            ratingScore=1
        render view:"viewPost",model:[link:link,doc:doc,topicList:topics,topicCount:Topic.count(),ratingScore:ratingScore]
    }

    def rate(){
        User user=User.findById(params.userId as Long)
        LinkResource link=LinkResource.findById(params.resourceId as Long)
        DocumentResource doc=DocumentResource.findById(params.resourceId as Long)
        ResourceRating rating=new ResourceRating()
        if(link) {
            rating = ResourceRating.findByUserAndResource(user, link)
        }
        else if(doc) {
            rating = ResourceRating.findByUserAndResource(user, doc)
        }
        if(rating) {
            rating.score = params.score as Integer
            rating.save(flush:true)
            flash.message="Updated the post rating"
        }
        else
            flash.message=resourceRatingService.save(params)
        if(link) {
            redirect action: "index", params: [name: link.topic.name, id: link.id]
        }
        else if(doc) {
            redirect action: "index", params: [name: doc.topic.name, id: doc.id]
        }
    }
}
