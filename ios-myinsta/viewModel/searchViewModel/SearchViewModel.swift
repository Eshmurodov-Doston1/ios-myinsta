import Foundation

class SearchViewModel:ObservableObject {
    @Published var isLoading = false
    @Published var items:[User] = []
    
    func getItemList(keyword:String,complation:@escaping ()->()){
        isLoading = true
        items.removeAll()
        DataBaseService()
            .loadUsers(keyword: keyword, complation: { items in
                self.items = items!
                self.isLoading = false
            })
        complation()
    }
}

