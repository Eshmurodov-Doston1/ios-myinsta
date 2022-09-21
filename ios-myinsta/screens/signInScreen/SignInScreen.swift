import SwiftUI

struct SignInScreen: View {
    @State var email:String = ""
    @State var password:String = ""
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1,Utils.color2])
                ,startPoint: .top, endPoint: .bottom)
                VStack{
                    Spacer()
                    Text("instagram_text")
                        .foregroundColor(.white)
                        .font(Font.custom("Billabong", size: 45))
                        .fontWeight(.bold)
                    TextField("email", text: $email)
                        .foregroundColor(.white)
                        .frame(height:45)
                        .padding(.horizontal,8)
                        .background(.white.opacity(0.5))
                        .font(Font.system(size: 16))
                        .cornerRadius(6)
                    
                    TextField("password", text: $password)
                        .foregroundColor(.white)
                        .frame(height:45)
                        .padding(.horizontal,8)
                        .background(.white.opacity(0.5))
                        .font(Font.system(size: 16))
                        .cornerRadius(6)
                        .padding(.top,5)
                    
                    Button {
                        
                    } label: {
                        Text("sign_in")
                            .foregroundColor(.white)
                            .font(Font.system(size: 15))
                    }
                    .frame(maxWidth:.infinity,maxHeight: 40)
                    .background(RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth:1.5)
                        .foregroundColor(.white))
                    .padding(.top,5)
                    Spacer()
                    HStack{
                        Text("no_account")
                            .foregroundColor(.white)
                            .font(Font.system(size: 15))
                        NavigationLink {
                            SignUpScreen()
                        } label: {
                            Text("sign_up")
                                .foregroundColor(.white)
                                .font(Font.system(size: 15))
                                .fontWeight(.bold)
                        }

                    }.padding()
                }.padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .accentColor(.white)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
