import Foundation

class ProfileViewModel:ObservableObject{
    @Published var isLoading:Bool = false
    @Published var items:[Post] = []
    
    func listItems(complation:@escaping ()->()){
        isLoading = true
        items.removeAll()
        self.items.append(Post(title: "Dostonbek Eshmurodov1", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageProgrammer))
        self.items.append(Post(title: "Dostonbek Eshmurodov2", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageCar1))
        self.items.append(Post(title: "Dostonbek Eshmurodov3", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageHome))
        self.items.append(Post(title: "Dostonbek Eshmurodov4", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageProgrammer))
        self.items.append(Post(title: "Dostonbek Eshmurodov5", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageCar1))
        self.items.append(Post(title: "Dostonbek Eshmurodov6", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageHome))
        self.items.append(Post(title: "Dostonbek Eshmurodov7", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageProgrammer))
        self.items.append(Post(title: "Dostonbek Eshmurodov8", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageCar1))
        self.items.append(Post(title: "Dostonbek Eshmurodov9", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageHome))
        isLoading = false
        complation()
    }
    
    
    func signOut(){
        SessionStore().signOut()
    }
}
