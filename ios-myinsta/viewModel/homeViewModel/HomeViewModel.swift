import Foundation

class HomeViewModel:ObservableObject{
    @Published var isLoading:Bool = false
    @Published var items:[Post] = []
    
    func itemsUploadData(complation:@escaping ()-> ()){
        isLoading = true
        items.removeAll()
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageProgrammer))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageCar1))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageHome))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageProgrammer))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageCar1))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageHome))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageProgrammer))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageCar1))
        self.items.append(Post(title: "Dostonbek Eshmurodov", content: "Dostonbek Eshmurodov Android va IOS Dasturlari bo'yicha Sineor Developer", imgUrl: Utils.imageHome))
        isLoading = false
        complation()
    }
}
