
import Foundation
import SwiftUI

class Utils{
    static var color1 = Color(red: 252/255, green: 175/255, blue: 69/255)
    static var color2 = Color(red: 245/255, green: 96/255, blue: 64/255)
    static var imageCar1 = "https://image.winudf.com/v2/image/aWQud2FsbHBhcGVyLmZlcnJhcmlfc2NyZWVuXzZfMTUwMjgwOTgyMl8wODc/screen-6.jpg?fakeurl=1&type=.jpg"
    static var imageHome = "https://assets.architecturaldesigns.com/plan_assets/9523/original/4_1491923602.jpg"
    static var imageProgrammer = "https://avatars.mds.yandex.net/i?id=eb4a2c0916b6bfde187236c6e292e5f8-5449367-images-thumbs&n=13"
    
    
    //Password or email validation
  
    private func isValidEmail(_ email: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPred.evaluate(with: email)
      }
      
    private func isPasswordValid(_ password : String) -> Bool{
          let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
          return passwordTest.evaluate(with: password)
      }
      
    func validView(email:String?,password:String?) -> String? {
          if !self.isValidEmail(email ?? "") {
              return "Email is invalid"
          }
          
          if !self.isPasswordValid(password ?? "") {
              return "Password is invalid"
          }
          
          // Do same like other validation as per needed
          
          return nil
      }
    
    
    static func currentData() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = df.string(from: date)
        return dateString
    }
    
}

extension UIScreen{
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
}
