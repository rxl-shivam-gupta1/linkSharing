package linksharing

import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage

class InviteController {
    MailSender mailSender

    def index() {
        if(!session.user){redirect(url:'/User')}
        def receiverEmail = params.email
        def topicId = params.topic as Long
        def topicName=Topic.findById(topicId)?.name
        def url="http://localhost:9090/topicShow/index?name=${topicName}"

        def mssg=new SimpleMailMessage()
        mssg.setFrom("testingExample232323@outlook.com")
        mssg.setTo("${receiverEmail}")
        mssg.setSubject("Invitation for Topic-${topicName}")
        mssg.setText("Click this link below to go to the Topic page: ${url}")
        mailSender.send(mssg)
        flash.message="Invite sent"
        redirect controller:"dashboard",action:"index"
    }
}
