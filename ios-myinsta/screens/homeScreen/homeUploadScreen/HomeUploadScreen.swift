import SwiftUI

struct HomeUploadScreen: View {
    @Binding var tabSelection:Int
    @State var caption:String=""
    @State var isPickerDisplay = false
    @State var isShowing = false
    @State var selectedImage:UIImage?
    @State var sourseType:UIImagePickerController.SourceType = .camera
    func uploadData(){
        if caption.isEmpty || selectedImage == nil{
            
        }
        //save server
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        if selectedImage != nil {
                           Image(uiImage: selectedImage!)
                                .resizable()
                                .frame(maxWidth:UIScreen.width,maxHeight: UIScreen.height/2.5)
                            VStack{
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        selectedImage = nil
                                    }, label: {
                                        Image(systemName: "xmark.circle")
                                            .resizable()
                                            .tint(.white)
                                            .padding(8)
                                            
                                    })
                                    .frame(maxWidth:50,maxHeight: 50)
                                }
                                Spacer()
                            }
                        }else{
                            Button {
                                isShowing.toggle()
                            } label: {
                                Image(systemName: "camera.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                    .frame(maxWidth:UIScreen.width,maxHeight: UIScreen.height/2.5)
                    .background(.gray.opacity(0.15))
                    .actionSheet(isPresented: $isShowing, content: {
                        ActionSheet(title: Text("upload_image")
                            .font(Font.system(size: 18))
                            .foregroundColor(.black),
                        buttons: [
                            .default(Text("pick_photo")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(.blue),action: {
                                        self.isPickerDisplay = true
                                        self.sourseType = .photoLibrary
                                    }),
                            .default(Text("take_photo")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(.blue),action: {
                                        self.isPickerDisplay = true
                                        self.sourseType = .camera
                            }),
                            .cancel()
                           
                        ])
                    })
                    .sheet(isPresented: $isPickerDisplay, content: {
                        ImagePickeView(selectedImage: $selectedImage, sourseType: sourseType)
                    })
                    
                    VStack{
                        TextField("caption", text: $caption)
                            .padding(.horizontal,8)
                            .frame(maxWidth:.infinity,maxHeight: 40)
                            .font(Font.system(size: 16))
                            .background(.gray.opacity(0.2))
                            .cornerRadius(6)
                        Divider()
                    }
                    .padding(.horizontal)
                    .padding(.top,10)
                    Spacer()
                }
            }
            .navigationBarItems(trailing: Button(action: {
                tabSelection = 0
            }, label: {
                Image(systemName:"square.and.arrow.up")
                    
            }))
            .navigationBarTitle("Upload",displayMode: .inline)
        }
    }
}

struct HomeUploadScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeUploadScreen(tabSelection: .constant(2))
    }
}
