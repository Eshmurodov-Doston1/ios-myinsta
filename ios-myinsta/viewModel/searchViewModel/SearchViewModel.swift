import Foundation

class SearchViewModel:ObservableObject {
    @Published var isLoading = false
    @Published var items:[User] = []
    
    func getItemList(complation:@escaping ()->()){
        isLoading = true
        items.removeAll()
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        items.append(User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
        isLoading = false
        complation()
    }
}
