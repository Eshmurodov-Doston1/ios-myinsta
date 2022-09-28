import Foundation
import FirebaseStorage

class StorageStore:ObservableObject {
    let storageRef = Storage.storage().reference()
    func uploadImage(uid:String,_ image:UIImage,complation:@escaping (String) -> Void){
        let imageRef = storageRef.child("users/"+uid+".jpg")
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return complation("")
        }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        imageRef.putData(imageData,metadata: metaData,completion: { [self] (metaData,error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return complation("")
            }
            imageRef.downloadURL(completion: { (url,error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return complation("")
                }
                let downloadUrl = String(describing: url!)
                print(downloadUrl)
                complation(downloadUrl)
            })
        })
       
    }
    
    
    func uplodaPostImage(uid:String,_ image:UIImage, complation:@escaping (String)->Void){
        let imageRef = storageRef.child("posts/"+uid+timeString()+".jpg")
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return complation("")
        }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        imageRef.putData(imageData,metadata: metaData,completion: { [self] (metaData,error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return complation("")
            }
            imageRef.downloadURL(completion: { (url,error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return complation("")
                }
                let downloadUrl = String(describing: url!)
                print(downloadUrl)
                complation(downloadUrl)
            })
        })
    }
    
    func timeString() -> String {
        let now  = Date()
        let formatter = ISO8601DateFormatter()
        let dateTime = formatter.string(from: now)
        print(dateTime)
        return dateTime
    }
}
