import SwiftUI

struct HomeProfileScreen: View {
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State var level = 2
    @State var columns:[GridItem] =
    Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15),spacing: 10),count: 2)
    func postSize()->CGFloat {
        if level == 1 {
            return UIScreen.width/CGFloat(level) - 20
        }
        return UIScreen.width/CGFloat(level) - 15
    }
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        Image("image_profile")
                            .resizable()
                            .frame(maxWidth:80,maxHeight: 80)
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(Circle().stroke(lineWidth:1.5).foregroundColor(.red.opacity(0.7)))
                        
                        HStack{
                            Spacer()
                            VStack {
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                                    .frame(maxWidth:20,maxHeight: 20)
                                    .foregroundColor(.blue)
                                    .overlay(Circle().stroke(lineWidth: 1).foregroundColor(.white))
                            }
                        }
                        .frame(maxWidth:80,maxHeight: 80)
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
                    ScrollView{
                        LazyVGrid(columns: columns){
                            ForEach(profileViewModel.items,id:\.self){ item in
                                ItemProfile(post: item, length: postSize())
                            }
                        }
                    }
                    .padding(.top,10)
                }
            }
            .navigationBarTitle("Profile",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "pip.exit")
                    .resizable()
                    .frame(maxWidth:20,maxHeight: 20)
                    .foregroundColor(.red)
            }))
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
