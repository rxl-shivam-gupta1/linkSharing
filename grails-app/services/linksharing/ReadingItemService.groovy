package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class ReadingItemService {

    List notReadList(String max,String offset,User user) {
        List itemList
        itemList = ReadingItem.createCriteria().list(max:max,offset:offset) {
            eq("user",user)
            eq("isRead",false)
        }
        return  itemList
    }

    def markAsRead(user,resource) {
        def readItem=ReadingItem.findByUserAndResource(user,resource)
        readItem.isRead=true
        if(readItem.save(flush:true,failOnError:true)){
            return true
        }else{
            return false
        }
    }
}
