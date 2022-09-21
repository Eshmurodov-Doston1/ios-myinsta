import SwiftUI

struct SignInScreen: View {
    @State var email:String = ""
    @State var password:String = ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Utils.color1,Utils.color2])
                           ,startPoint: .top, endPoint: .bottom)
            VStack{
                Spacer()
                Text("Instagram")
                    .foregroundColor(.white)
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .frame(height:45)
                    .padding(.horizontal,8)
                    .background(.white.opacity(0.5))
                    .font(Font.system(size: 16))
                    .cornerRadius(6)
                
                TextField("Password", text: $password)
                    .foregroundColor(.white)
                    .frame(height:45)
                    .padding(.horizontal,8)
                    .background(.white.opacity(0.5))
                    .font(Font.system(size: 16))
                    .cornerRadius(6)
                    .padding(.top,5)
                
                Button {
                    
                } label: {
                    Text("Sign In")
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
                    Text("Don't have an account?")
                        .foregroundColor(.white)
                        .font(Font.system(size: 15))
                    NavigationLink {
                        SignUpScreen()
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(Font.system(size: 15))
                            .fontWeight(.bold)
                    }

                }
                .padding()
                
            }.padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
