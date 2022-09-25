import Foundation
import Combine
import Firebase
class SessionStore:ObservableObject{
    var didChange = PassthroughSubject<SessionStore,Never>()
    @Published var session:User? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    func listener(){
        handle = Auth.auth().addStateDidChangeListener { (auth,user) in
            if let user = user {
                print("Got user: \(user)")
                self.session = User(uid:user.uid,email: user.email,displayName: user.displayName)
            } else {
                self.session = nil
            }

        }
    }
    
    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        }catch {
            return false
        }
    }
}
