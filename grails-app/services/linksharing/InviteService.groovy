package linksharing

import grails.gorm.transactions.Transactional
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage

@Transactional
class InviteService {
    MailSender mailSender

    String sendInvite(def receiverEmail,def topicName,def url) {
        def mssg=new SimpleMailMessage()
        mssg.setFrom("testingExample232323@outlook.com")
        mssg.setTo("${receiverEmail}")
        mssg.setSubject("Invitation for Topic-${topicName}")
        mssg.setText("Click this link below to go to the Topic page: ${url}")
        mailSender.send(mssg)
        return "Invite Sent"
    }
}
