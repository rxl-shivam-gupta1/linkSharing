package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class LinkResourceService {

    String save(LinkResource link){
        link.save(flush:true)
        for(user in User.list()){
            ReadingItem readingItem=new ReadingItem()
            readingItem.resource=link
            readingItem.user=user
            readingItem.isRead=false
            readingItem.save(flush:true)
        }
        return "Added Link Resource"
    }

    List list(String max,String offset,User user) {
        List linkList
        linkList = LinkResource.createCriteria().list(max:max,offset:offset) {
            eq("createdBy",user)
        }
        return  linkList
    }

    List resList(String name) {
        List linkList
        linkList = LinkResource.createCriteria().list() {
            eq("topic",Topic.findByName(name))
        }
        return  linkList
    }
}
