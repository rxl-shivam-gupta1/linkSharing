package linksharing

import grails.converters.JSON

class AdminController {

    def editUserStance(){
        if(!session.user){redirect(url:'/User')}
        def user = User.get(params.userId as Long)
        user.active = !user.active
        if(user.save(flush: true,failOnError:true)) {
            render([success: true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }

    def deleteTopic(){
        if(!session.user){redirect(url:'/User')}
        def topic=Topic.get(params.topicId as Long)
        topic.delete(flush:true,failOnError:true)
        def deletedTopic=Topic.get(params.topicId as Long)
        if(!deletedTopic) {
            render([success: true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }

    def deleteSub(){
        if(!session.user){redirect(url:'/User')}
        def sub=Subscription.get(params.subId as Long)
        sub.delete(flush:true,failOnError:true)
        def deletedSub=Subscription.get(params.subId as Long)
        if(!deletedSub) {
            render([success: true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }

    def deletePost(){
        if(!session.user){redirect(url:'/User')}
        def post=Resource.get(params.postId as Long)
        def readingItem=ReadingItem.findAllByResource(post)
        def rating=ResourceRating.findAllByResource(post)
        rating.each{it.delete(flush:true,failOnError:true)}
        readingItem.each{it.delete(flush:true,failOnError:true)}
        post.delete(flush:true,failOnError:true)
        def deletedPost=Resource.get(params.postId as Long)
        if(!deletedPost) {
            render([success: true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }
}
