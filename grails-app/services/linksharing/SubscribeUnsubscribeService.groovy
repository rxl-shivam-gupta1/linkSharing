package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SubscribeUnsubscribeService {

    def subscribe(topicId,userId,seriousness){
        def topic=Topic.findById(topicId)
        def user=User.findById(userId)
        Subscription subs=new Subscription(topic:topic,user:user,seriousness:seriousness )
        if(subs?.save(flush:true,flushOnError:true)){
            return true
        }else {
            return false
        }

    }

    def unsubscribe(topicId,userId){
        def topic=Topic.findById(topicId)
        def user=User.findById(userId)
        if(topic?.createdBy?.id==user?.id){
            return false
        }
        Subscription subs=Subscription.findByTopicAndUser(topic,user)
        if(subs){
            subs.delete(flush:true,flushOnError:true)
            return true
        }else {
            return false
        }

    }
}
