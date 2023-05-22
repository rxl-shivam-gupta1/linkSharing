package linksharing

class Subscription {
    Topic topic
    User user
    Seriousness seriousness = Seriousness.VERY_SERIOUS
    Date dateCreated

    static constraints = {
    }
}
