package linksharing

class Topic {
    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility = Visibility.PUBLIC

    static hasMany = [subscriptions:Subscription,linkResources:LinkResource,docResources:DocumentResource]

    static constraints = {
        name unique:"createdBy"
    }
}
