package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class ResourceRatingService {

    String save(params) {
        ResourceRating rating=new ResourceRating()
        User user=User.findById(params.userId as Long)
        LinkResource link=LinkResource.findById(params.resourceId as Long)
        DocumentResource doc=DocumentResource.findById(params.resourceId as Long)
        rating.user=user
        rating.score=params.score as Integer
        if(link)
            rating.resource=link
        else if(doc)
            rating.resource=doc
        rating.save(flush:true)
        return "Rated the post"
    }
}
