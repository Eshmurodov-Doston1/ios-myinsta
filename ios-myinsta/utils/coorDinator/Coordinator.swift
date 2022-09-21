import Foundation
import SwiftUI
import Combine

class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var picker:ImagePickeView
    
    init(picker:ImagePickeView){
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.presentation.wrappedValue.dismiss()
    }
    
    
}
