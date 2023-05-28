package linksharing

class LoginController {

    TopicService topicService = new TopicService()

    def index() {
        def max = params.max ?: "5"
        def offset = params.offset ?: "0"
        List topics = topicService.recentList(max, offset)
        def model = [topicList: topics, topicCount: topicService.count()]
        if (request.xhr)
            render template: "posts", model: [tList: model.topicList, tCount: model.topicCount]
        else
            render view: "index", model: model
    }

    def user() {
        User user = User.findByUserName(params.userName)
        if (user == null) {
            flash.warn = "User does not exist. Please register"
            redirect action: "index"
        } else if (user.passWord == params.passWord && user.active == true) {
            session.user = user
            redirect controller: "dashboard", action: "index"
        } else if (user.active == false) {
            flash.warn = "User has been deactivated"
            redirect action: "index"
        } else {
            flash.warn = "Incorrect password"
            redirect action: "index"
        }
    }

    def forgotPass() {
        render view: "/forgotPass", model: [controller: "forgotPassword"]
    }

//    def list() {
//        def max = params.max ?: "5"
//        def offset = params.offset ?: "0"
//        List topics=topicService.recentList(max,offset)
//        def model=[topicList:topics,topicCount:topicService.count()]
//        if(request.xhr)
//            render template:"posts",model:model
//        else
//            model
//    }
}
