package linksharing

class LogoutController {

    def index() {
        session.invalidate()
        flash.message="Logout Successful"
        redirect controller:"login"
    }
}
