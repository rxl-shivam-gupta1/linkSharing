package linksharing

class LoginController {

    TopicService topicService=new TopicService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List topics=topicService.recentList(max,offset)
//        User user = User.findByUserName(params.userName)
        render view:"index",model:[topicList:topics,topicCount:topicService.count()]
    }

    def user() {
        User user = User.findByUserName(params.userName)
        if (user == null) {
            flash.warn="User does not exist. Please register"
            redirect action:"index"
        }
        else if(user.passWord==params.passWord) {
            session.user = user
            redirect controller: "dashboard", action: "index"
        }else
            flash.pass="Incorrect password"
    }
}
