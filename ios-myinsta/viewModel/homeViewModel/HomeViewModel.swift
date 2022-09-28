import Foundation

class HomeViewModel:ObservableObject{
    @Published var isLoading:Bool = false
    @Published var items:[Post] = []
    
    func apiFeedList(uid:String){
        isLoading = true
        items.removeAll()
        DataBaseService().loadFeeds(uid:uid,complation: { posts in
            self.items = posts!
            self.isLoading = false
        })
    }
}
