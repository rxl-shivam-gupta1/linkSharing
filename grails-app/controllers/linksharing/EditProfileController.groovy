package linksharing

class EditProfileController {
    EditUserProfileService editUserProfileService=new EditUserProfileService()

    def index() {
        render view:"editProfile"
    }

    def changePass(){
        def userId
        if(session.user)
            userId=session.user.id
        else {
            User user = User.findByUserName(params.userName)
            userId = user.id
        }
        if(editUserProfileService.changePassword(params,userId)){
            session.invalidate()
            flash.message="Password changed Successfully"
            redirect(url:'/login/index')
        }else{
            flash.error="Password Mismatch"
            redirect(url:'/editProfile/index')
        }
    }

    def editDetails(){
        def userId=session.user.id
        def mssg=editUserProfileService.editDetails(params,userId)
        flash.message=mssg
        session.user=User.findById(userId as Long)
        redirect(url:'/dashboard/index')
    }
}
