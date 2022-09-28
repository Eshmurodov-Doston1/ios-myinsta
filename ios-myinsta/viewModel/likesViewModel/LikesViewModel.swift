import Foundation

class LikesViewModel:ObservableObject{
    @Published var isLoading:Bool = false
    @Published var items:[Post] = []
    
    func itemsUploadData(complation:@escaping ()-> ()){
        isLoading = true
        items.removeAll()
       
        isLoading = false
        complation()
    }
}
