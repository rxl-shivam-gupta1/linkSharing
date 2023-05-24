package linksharing

class AllShowController {
    AllShowService allShowService=new AllShowService()

    def allUsers() {
        List userList=User.list()
        render view:"allUsers",model:[users:userList]
    }

    def allTopics() {
        List topicList=Topic.list()
        render view:"allTopics",model:[topics:topicList]
    }

    def allLinks() {
        List postList=LinkResource.list()
        render view:"allPosts",model:[posts:postList]
    }

    def allDocs() {
        List postList=DocumentResource.list()
        render view:"allPosts",model:[posts:postList]
    }

    def userTopics() {
        List topicList=allShowService.topicList(session.user)
        render view:"userTopics",model:[topics:topicList]
    }

    def userSubs() {
        List subList=allShowService.subList(session.user)
        render view:"userSubs",model:[subs:subList]
    }

    def topicSubs() {
        List subList=allShowService.topicSubList(params.name)
        render view:"topicSubs",model:[subs:subList]
    }
}
