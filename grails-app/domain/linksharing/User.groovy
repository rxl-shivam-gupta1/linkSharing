package linksharing

class User {
    String email
    String userName
    String passWord
    String firstName
    String lastName
    String photo
    Boolean admin=false
    Boolean active=true
    Date dateCreated
    Date lastUpdated

    static hasMany = [topics:Topic,subscriptions:Subscription,linkResources:LinkResource,readingItems:ReadingItem,ratings:ResourceRating,docResources:DocumentResource]

    static constraints = {
        email unique:true,email:true
        userName unique:true
        passWord unique:true
        lastName nullable:true
        photo nullable:true
    }

    static mapping = {
        table 'USER_DETAILS'
    }
}
