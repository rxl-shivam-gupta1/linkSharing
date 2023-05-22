package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    Subscription get(Serializable id){}

    List list(String max,String offset,User user) {
        List subList
        subList = Subscription.createCriteria().list(max:max,offset:offset) {
            eq("user",user)
        }
        return  subList
    }

    Long count(){
        return Subscription.count()
    }

    void delete(Serializable id){}

    Subscription save(Subscription subscription){
        subscription.save(flush:true)
    }

    def create(Topic topic){
        Subscription sub=new Subscription()
        sub.topic=topic
        sub.user=topic.createdBy
        sub.seriousness=Seriousness.VERY_SERIOUS
        sub.save(flush:true)
        return sub
    }
}
