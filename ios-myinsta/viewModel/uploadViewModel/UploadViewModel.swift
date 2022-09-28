import Foundation
import FirebaseStorage
import Firebase
import SwiftUI

class UploadViewModel:ObservableObject {
    @Published var isLoading = false
    func apiUploadPostImage(uid:String,image:UIImage, complation:@escaping (String) -> ()){
        StorageStore().uplodaPostImage(uid: uid, image, complation: { downloadUrl in
            print(downloadUrl)
            complation(downloadUrl)
        })
    }
    
    func apiUploadPost(uid:String,caption:String,image:UIImage,complation:@escaping (Bool) -> ()){
        isLoading = true
        apiLoadUser(uid: uid, complation: { user in
            self.apiUploadPostImage(uid: uid, image: image, complation: { downloadUrl in
                var post = Post(caption: caption, imgPost: downloadUrl)
                post.displayName = user?.displayName!
                post.uid = user?.uid!
                post.imgUser = user?.imageUrl!
                DataBaseService().storePost(post: post, complation: { data in
                    self.isLoading = false
                    complation(data)
                })
            })
        })
    }
    
    func apiLoadUser(uid:String,complation:@escaping (User?) -> ()){
        DataBaseService().loadUser(uid: uid, complation:{ userData in
            complation(userData ?? nil)
        })
    }
}
