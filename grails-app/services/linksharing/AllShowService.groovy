package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class AllShowService {

    List topicList(user) {
        List topics
        topics = Topic.createCriteria().list() {
            eq("createdBy",user)
        }
        return  topics
    }

    List subList(user) {
        List subs
        subs = Subscription.createCriteria().list() {
            eq("user",user)
        }
        return  subs
    }
}
