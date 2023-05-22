package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SubscriptionController {

    SubscriptionService subscriptionService

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
            '*'{ render status: NOT_FOUND }
        }
    }
}
