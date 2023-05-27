package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    List recentList(String max,String offset) {
        List topicList
        topicList = Topic.createCriteria().list(max:max,offset:offset) {
            order("lastUpdated","desc")
        }
        return  topicList
    }

    List list(String max,String offset) {
        List topicList
        topicList = Topic.createCriteria().list(max:max,offset:offset) {
            eq("visibility",Visibility.PUBLIC)
        }
        return  topicList
    }

    Topic get(String name){
        Topic topic=Topic.findByName(name)
        return topic
    }

    Long count(){
        return Topic.count()
    }

    void delete(Serializable id){}

    String save(Topic topic){
        topic.save(flush:true)
        return "Created New Topic"
    }
}
