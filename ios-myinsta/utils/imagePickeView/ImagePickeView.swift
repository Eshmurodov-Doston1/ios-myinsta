import Foundation
import SwiftUI
import UIKit


struct ImagePickeView:UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    @Binding var selectedImage:UIImage?
    @Environment(\.presentationMode) var presentation
    var sourseType:UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var imagePicker = UIImagePickerController()
         imagePicker.sourceType = self.sourseType
         imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}
