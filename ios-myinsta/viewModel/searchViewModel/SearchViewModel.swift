import Foundation

class SearchViewModel:ObservableObject {
    @Published var isLoading = false
    @Published var items:[User] = []
    
    func getSearchItems(uid:String,keyword:String,complation:@escaping ()-> ()){
        isLoading = true
        items.removeAll()
        DataBaseService()
            .loadUsers(keyword: keyword, complation: { items in
                DataBaseService().loadFollowing(uid:uid){ following in
                    print("Folowing\(following)")
                    self.items = self.margeUser(uid:uid,users:items!,following:following)
                    self.isLoading = false
                }
                
                self.items = items!
                self.isLoading = false
            })
        complation()
    }
    
    
    func margeUser(uid:String,users:[User],following:[User]) -> [User] {
        var items:[User] = []
        for i in users {
            
            var user = i
            
            for f in following {
                if i.uid == f.uid {
                    user.isFolowed = true
                    break
                }
            }
            if uid != user.uid {
                print("Items\(i)")
                items.append(user)
            }
        }
        return items
    }
    
    func apiFolowUser(uid:String,to:User){
        DataBaseService().loadUser(uid: uid, complation: { me in
            DataBaseService().followUser(me:me!,to:to){ isFolowing in
                self.getSearchItems(uid:uid,keyword: "", complation: {
                    
                })
            }
        })
    }
    func apiUnFolowUser(uid:String,to:User){
        DataBaseService().loadUser(uid: uid, complation: { me in
            DataBaseService().unFollowUser(me:me!,to:to){ isFolowing in
                self.getSearchItems(uid:uid,keyword: "", complation: {
                    
                })
            }
        })
    }
    
}

