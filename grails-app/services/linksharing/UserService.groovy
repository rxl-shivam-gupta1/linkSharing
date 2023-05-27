package linksharing

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class UserService {

    def save(def params) {
        User user=new User()
        if(User.findByUserName(params.userName)){
            return "userName not available"
        }else if(params.passWord!=params.confirm){
            return "Password mismatch"
        }else{
            user.firstName=params.firstName
            user.lastName=params.lastName
            user.email=params.email
            user.userName=params.userName
            user.passWord=params.passWord
            if(params.photo && !params.photo.isEmpty()){
                def multipartFile=params.photo
                def photoExtension=multipartFile.getOriginalFilename().tokenize('.')[-1]
                def bytes=multipartFile.getBytes()
                def url="grails-app/assets/images/profilePhoto/${params.userName}.${photoExtension}"
                def newFile=new File("${url}")
                newFile.createNewFile()
                newFile.append(bytes)
                params.photo=url.substring(25)
                user.photo=params.photo
            }else{
                user.photo='profilePhoto/user (1).png'
            }
            user.validate()
            if(user.hasErrors()){
                return "Password Length should be between 5 and 8"
            }
            else  {
                user.save(flush:true,failOnError:true)
                return ""
            }
        }
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
