package linksharing

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class UserService {

    def save(User user) {
//        User user=new User()
//
//        if(params.passWord==params.confirm) {
//            user.properties=params
//        }
//        else
//            render "Incorrect password"

        user.save()
    }

    Long count(){
        return User.count()
    }

    def list(){
        return User.list()
    }

    User get(Serializable id){
        User.get(id)
    }
}
