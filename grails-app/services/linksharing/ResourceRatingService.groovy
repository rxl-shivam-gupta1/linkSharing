package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class ResourceRatingService {

    def save(ResourceRating rating) {
        rating.save(flush:true)
    }
}
