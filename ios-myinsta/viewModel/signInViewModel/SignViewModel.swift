import Foundation
import Firebase

class SignInViewModel:ObservableObject {
    @Published var isLoading = false
    
    func signIns(email:String,password:String,complation: @escaping (Bool,String?) -> ()){
        self.isLoading = true
        Auth.auth().signIn(withEmail: email, password: password){ (response,error) in
            self.isLoading = false
            if error != nil{
                print("Error_Data \((error?.localizedDescription)!)")
                complation(false,(error?.localizedDescription)!)
            }else{
                complation(true,nil)
            }
            SessionStore().listener()
        }
    }
}
