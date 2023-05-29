package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SearchService {

    def searchData(Map params,user){
        if(!user){
            if(params?.query==''){
                return Topic.list()
            }
            else{
                return Resource.createCriteria().list{
                    createAlias('topic','t')
                    or{
                        eq('topic.id', Topic.findByNameLike("%${params?.query}%"))
                        ilike("description", "%${params?.query}%")
                    }
                }
            }
        }
        else{
            if(user.admin){
                if(params.query==''){
                    return Resource.list()
                }
                else{
                    return Resource.createCriteria().list{
                        createAlias('topic','t')
                        or{
                            inList('topic.id', Topic.findAllByNameLike("%${params?.query}%").id)
                            ilike("description", "%${params?.query}%")
                        }
                    }
                }
            }
            else{
                if (params?.query != '') {
                    return Resource.createCriteria().list {
                        createAlias('topic', 't')
                        or {
                            eq 't.visibility', Visibility.PUBLIC
                            eq 't.createdBy', user
                        }
                        or {
                            eq('topic.id', Topic.findByNameLike("%${params?.query}%"))
                            ilike("description", "%${params?.query}%")
                        }
                    }
                }
                else{
                    return null
                }
            }
        }
    }
}
