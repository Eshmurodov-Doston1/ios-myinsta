import Foundation
import Firebase
import FirebaseFirestore
class SignUpViewModel:ObservableObject {
    @Published var isLoading = false
    
    func signUp(email:String,password:String,complation:@escaping (Bool,String?) -> ()){
         isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { (response,error) in
            self.isLoading = false
            if error != nil {
                complation(false, (error?.localizedDescription)!)
            } else {
                complation(true,nil)
            }
        }
    }
    
    func saveUser(user:User){
        DataBaseService().storeUser(user: user)
    }
}
