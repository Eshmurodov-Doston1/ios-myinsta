import Foundation
import SwiftUI
class ProfileViewModel:ObservableObject{
    @Published var isLoading:Bool = false
    @Published var items:[Post] = []
    
    @Published var email:String = ""
    @Published var displayName:String = ""
    @Published var password:String = ""
    @Published var imageUser:String = ""
    
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
    
    
    func getUserData(uid:String){
        isLoading = true
        DataBaseService().loadUser(uid: uid){ user in
            self.email = user?.email ?? ""
            self.password = user?.password ?? ""
            self.displayName = user?.displayName ?? ""
            self.imageUser = user?.imageUrl ?? ""
            self.isLoading = false
        }
    }
    
    func uploadImageUser(uid:String,image:UIImage){
        isLoading = true
        StorageStore().uploadImage(uid: uid, image, complation: { downloadUrl  in
            self.apiUpdateUserImage(uid: uid, imageUrl: downloadUrl)
            self.getUserData(uid: uid)
        })
    }
    
    func apiUpdateUserImage(uid:String,imageUrl:String?){
        DataBaseService().updateImage(uid: uid, imgUrl: imageUrl)
    }
}
