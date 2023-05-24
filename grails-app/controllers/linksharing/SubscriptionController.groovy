package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class SubscriptionController {

    SubscriptionService subscriptionService
    SubscribeUnsubscribeService subscribeUnsubscribeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        redirect controller:"dashboard",action:"index"
    }

    def show(Long id) {
        respond subscriptionService.get(id)
    }

    def create(Topic topic) {
        subscriptionService.create(topic)
    }

    def save(Subscription subscription) {
        if (subscription == null) {
            notFound()
            return
        }

        try {
            subscriptionService.save(subscription)
        } catch (ValidationException e) {
            respond subscription.errors, view:'create'
        }
        forward controller:"dashboard",action:"index", model: [first: session.user.firstName,
                                                               last: session.user.lastName,
                                                               name: session.user.userName]
    }

    def edit(Long id) {
        respond subscriptionService.get(id)
    }

    def update(Subscription subscription) {
        if (subscription == null) {
            notFound()
            return
        }

        try {
            subscriptionService.save(subscription)
        } catch (ValidationException e) {
            respond subscription.errors, view:'edit'
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        subscriptionService.delete(id)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message',
                        args: [message(code: 'subscription.label', default: 'Subscription'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

        def subscribeTopic(){
            if(!session.user){redirect(url:'/User')}
            def topicId=params.topicId as Long
            def userId=params.userId as Long
            def seriousness=params.seriousness
            if(subscribeUnsubscribeService.subscribe(topicId,userId,seriousness))
            {
                render([success:true] as JSON)
            }else{
                render([success:false] as JSON)
            }
        }

        def unsubscribeTopic(){
            if(!session.user){redirect(url:'/User')}
            def topicId=params.topicId as Long
            def userId=params.userId as Long
            if(subscribeUnsubscribeService.unsubscribe(topicId,userId)){
                render([success:true] as JSON)
            }else{
                render([success:false] as JSON)
            }
        }
}
