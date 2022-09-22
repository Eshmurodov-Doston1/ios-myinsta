
import Foundation
import SwiftUI

class Utils{
    static var color1 = Color(red: 252/255, green: 175/255, blue: 69/255)
    static var color2 = Color(red: 245/255, green: 96/255, blue: 64/255)
    static var imageCar1 = "https://image.winudf.com/v2/image/aWQud2FsbHBhcGVyLmZlcnJhcmlfc2NyZWVuXzZfMTUwMjgwOTgyMl8wODc/screen-6.jpg?fakeurl=1&type=.jpg"
    static var imageHome = "https://assets.architecturaldesigns.com/plan_assets/9523/original/4_1491923602.jpg"
    static var imageProgrammer = "https://avatars.mds.yandex.net/i?id=eb4a2c0916b6bfde187236c6e292e5f8-5449367-images-thumbs&n=13"
}

extension UIScreen{
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
}
