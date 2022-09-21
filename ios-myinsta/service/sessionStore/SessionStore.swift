
import Foundation
import Combine

class SessionStore:ObservableObject{
    var didChange = PassthroughSubject<SessionStore,Never>()
    @Published var session:User? {didSet {self.didChange.send(self)}}
    
    func listener(){
        self.session = User(uid: "uid", email: "uid@gmail.com", displayName: "uid")
    }
}
