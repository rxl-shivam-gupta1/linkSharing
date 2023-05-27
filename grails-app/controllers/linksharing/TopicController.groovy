package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TopicController {

    TopicService topicService
    def subscriptionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        redirect controller:"login",action:"index"
    }

    def show() {
        respond topicService.get(params.name)
    }

    def create() {
        Topic topic= new Topic(params)
        respond topic
    }

    def save(Topic topic) {
        if (topic == null) {
            notFound()
            return
        }

        try {
            flash.message=topicService.save(topic)
        } catch (ValidationException e) {
            respond topic.errors, view:'create'
        }
        subscriptionService.create(topic)
        redirect controller:"dashboard",action:"index"
    }

    def edit(Long id) {
        respond topicService.get(id)
    }

    def update(Topic topic) {
        if (topic == null) {
            notFound()
            return
        }

        try {
            topicService.save(topic)
        } catch (ValidationException e) {
            respond topic.errors, view:'edit'
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        topicService.delete(id)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
