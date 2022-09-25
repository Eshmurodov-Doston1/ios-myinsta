
import Foundation

struct User: Hashable {
    var uid:String?
    var email:String?
    var displayName:String?
    var password:String?
    var imageUrl:String?
    
    init(email:String?,displayName:String?,password:String?,imageUrl:String?){
        self.email = email
        self.displayName = displayName
        self.password = password
        self.imageUrl = imageUrl
    }
    
    init(uid:String?,email:String?,displayName:String?){
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
