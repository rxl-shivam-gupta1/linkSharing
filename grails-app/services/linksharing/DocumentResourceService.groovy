package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class DocumentResourceService {

    String save(DocumentResource doc){
        doc.save(flush:true)
        return "Added Document Resource"
    }

    List list(String max,String offset,User user) {
        List docList
        docList = DocumentResource.createCriteria().list(max:max,offset:offset) {
            eq("createdBy",user)
        }
        return  docList
    }
}
