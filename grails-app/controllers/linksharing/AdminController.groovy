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
}
