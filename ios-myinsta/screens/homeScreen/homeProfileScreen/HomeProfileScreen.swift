import SwiftUI
import SDWebImageSwiftUI

struct HomeProfileScreen: View {
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State var level = 2
    @State var columns:[GridItem] =
    Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15),spacing: 10),count: 2)
    @State var isShowing = false
    @State var isPickerDisplay = false
    @State var selectedImage:UIImage?
    @State var sourseType:UIImagePickerController.SourceType = .camera
    @State var isShowingAlert = false
    @State var messageAlert = ""
    func postSize()->CGFloat {
        if level == 1 {
            return UIScreen.width/CGFloat(level) - 20
        }
        return UIScreen.width/CGFloat(level) - 15
    }
    
    
    func signOut(){
        profileViewModel.signOut()
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        if selectedImage == nil {
                            Image("image_profile")
                                .resizable()
                                .frame(maxWidth:80,maxHeight: 80)
                                .clipShape(Circle())
                                .padding(2)
                                .overlay(Circle().stroke(lineWidth:1.5).foregroundColor(.red.opacity(0.7)))
                        } else {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .frame(maxWidth:80,maxHeight: 80)
                                .clipShape(Circle())
                                .padding(2)
                                .overlay(Circle().stroke(lineWidth:1.5).foregroundColor(.red.opacity(0.7)))
                        }
                        
                        
                        HStack{
                            Spacer()
                            VStack {
                                Spacer()
                                Button(action: {
                                    isShowing.toggle()
                                }, label: {
                                    Image(systemName: "plus.circle.fill")
                                })
                                    .frame(maxWidth:20,maxHeight: 20)
                                    .foregroundColor(.blue)
                                    .overlay(Circle().stroke(lineWidth: 1).foregroundColor(.white))
                            }
                        }
                        .frame(maxWidth:80,maxHeight: 80)
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
                    }
                    VStack(spacing:5){
                        Text("Dostonbek Eshmurodov")
                            .font(Font.system(size: 15))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.top,1)
                        Text("eshmurodovdoston630@gmail.com")
                            .font(Font.system(size: 13))
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                    }
                    HStack{
                        VStack(spacing:5){
                            Text("360")
                                .font(Font.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Posts")
                                .font(Font.system(size: 13))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth:UIScreen.width/3,maxHeight: 60)
                        VStack{}.frame(maxWidth:1,maxHeight: 25)
                            .background(Color.gray.opacity(0.7))
                        VStack(spacing:5){
                            Text("4.325")
                                .font(Font.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Folowers")
                                .font(Font.system(size: 13))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth:UIScreen.width/3,maxHeight: 60)
                        VStack{}.frame(maxWidth:1,maxHeight: 25)
                            .background(Color.gray.opacity(0.7))
                        VStack(spacing:5){
                            Text("829")
                                .font(Font.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Folowing")
                                .font(Font.system(size: 13))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth:UIScreen.width/3,maxHeight: 60)
                    }
                    .padding(.top,10)
                    
                    HStack {
                        Button(action: {
                            level = 1
                            columns =  Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15),spacing: 10),count: 1)
                        }, label: {
                            Image(systemName:"rectangle.grid.1x2")
                                .foregroundColor(.red)
                        })
                        .frame(maxWidth:UIScreen.width/2)
                        
                        Button(action: {
                            level = 2
                            columns =  Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15),spacing: 10),count: 2)
                        }, label: {
                            Image(systemName:"square.grid.2x2")
                                .foregroundColor(.red)
                        })
                        .frame(maxWidth:UIScreen.width/2)
                    }
                    
                    ScrollView{
                        LazyVGrid(columns: columns, content: {
                            ForEach(profileViewModel.items,id: \.self){ item in
                                ItemProfile(post: item, length: postSize())
                            }
                        })
                    }
                    .padding(.top,10)
                }
            }
            .navigationBarTitle("Profile",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                isShowingAlert.toggle()
                messageAlert = String(localized: "log_out",comment: "Comment data")
                
            }, label: {
                Image(systemName: "pip.exit")
                    .resizable()
                    .frame(maxWidth:20,maxHeight: 20)
                    .foregroundColor(.red)
            })
                .alert(isPresented: $isShowingAlert) {
                    return Alert(title: Text("Sig Out"), message: Text(messageAlert), primaryButton: .destructive(Text("Confirm"),action: {
                        signOut()
                    }), secondaryButton: .cancel())
                }
            )
        }
        .onAppear{
            profileViewModel.listItems {
                print(profileViewModel.items.count)
            }
        }
    }
}

struct HomeProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileScreen()
    }
}
