package linksharing

class Resource {
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic:Topic]
    static hasMany = [readers:ReadingItem]

    static constraints = {
        description maxSize:200
    }

    static mapping = {
        table 'RESOURCE_LIST'
    }
}
