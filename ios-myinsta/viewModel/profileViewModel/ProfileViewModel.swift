import Foundation
import SwiftUI
class ProfileViewModel:ObservableObject{
    @Published var isLoading:Bool = false
    @Published var items:[Post] = []
    
    @Published var email:String = ""
    @Published var displayName:String = ""
    @Published var password:String = ""
    @Published var imageUser:String = ""
    
    func aiLoadPosts(uid:String){
        isLoading = true
        items.removeAll()
        DataBaseService().loadPosts(uid:uid,complation: { posts in
            self.items = posts!
            self.isLoading = false
        })
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
