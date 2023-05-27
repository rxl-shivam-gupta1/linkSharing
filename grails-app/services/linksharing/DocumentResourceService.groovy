package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class DocumentResourceService {

    String save(DocumentResource doc){
        doc.save(flush:true)
        for(a in User.list()){
            ReadingItem readingItem=new ReadingItem()
            readingItem.resource=doc
            readingItem.user=a
            readingItem.isRead=false
            readingItem.save(flush:true)
        }
        return "Added Document Resource"
    }

    List list(String max,String offset,User user) {
        List docList
        docList = DocumentResource.createCriteria().list(max:max,offset:offset) {
            eq("createdBy",user)
        }
        return  docList
    }

    List resList(String name) {
        List docList
        docList = DocumentResource.createCriteria().list() {
            eq("topic",Topic.findByName(name))
        }
        return  docList
    }

    def create(params){
        Topic topic = Topic.get(params.documentTopic as Long)
        User user=User.findById(params.userId as Long)
        Resource r = new DocumentResource(description: params.documentDescription,
                createdBy: user, topic: topic)
        def multipartFile=params.documentResource
        def originalFile=multipartFile.getOriginalFilename()
        def bytes=multipartFile.getBytes()
        def url="src/main/resources/public/documents/${originalFile}"
        def dbpath="/static/documents/${originalFile}"
        def newFile=new File("${url}")
        newFile.createNewFile()
        newFile.append(bytes)
        r.filePath=dbpath
        r.validate()
//        if (r.hasErrors()) {
//            return "Please try again"
//        }
//        else {
            r.save(flush: true,failOnError:true)
//            def subscriber=Subscription.findAllByTopic(r.topic).user
//            subscriber.each {it->
//                def read=new ReadingItem(user: it,resource: r)
//                read.save(flush:true,failOnError:true)
//            }
//            return ""
//        }
        for(user2 in User.list()){
            ReadingItem readingItem=new ReadingItem()
            readingItem.resource=r
            readingItem.user=user2
            readingItem.isRead=false
            readingItem.save(flush:true)
        }
    }
}
