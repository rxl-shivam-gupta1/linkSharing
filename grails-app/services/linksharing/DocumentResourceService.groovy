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
}
