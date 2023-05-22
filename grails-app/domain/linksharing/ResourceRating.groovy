package linksharing

class ResourceRating {
    Resource resource
    User user
    Integer score

    static constraints = {
        score range:1..5
    }
}
