import SwiftUI

struct SignUpScreen: View {
    @State var fullName:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var cPassword:String = ""
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1,Utils.color2]), startPoint: .top, endPoint: .bottom)
                VStack{
                    Spacer()
                    Text("instagram_text")
                        .foregroundColor(.white)
                        .font(Font.custom("Billabong", size: 40))
                    TextField("full_name", text: $fullName)
                        .padding(.horizontal,8)
                        .frame(maxWidth:.infinity,maxHeight: 40)
                        .background(.white.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                    TextField("email", text: $email)
                        .padding(.horizontal,8)
                        .frame(maxWidth:.infinity,maxHeight: 40)
                        .background(.white.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .padding(.top,6)
                    SecureField("password", text: $password)
                        .padding(.horizontal,8)
                        .frame(maxWidth:.infinity,maxHeight: 40)
                        .background(.white.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .padding(.top,6)
                    SecureField("confirm_password", text: $cPassword)
                        .padding(.horizontal,8)
                        .frame(maxWidth:.infinity,maxHeight: 40)
                        .background(.white.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .padding(.top,6)
                    Button {
                        
                    } label: {
                        Text("sign_up")
                            .foregroundColor(.white)
                            .font(Font.system(size: 15))
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth:.infinity,maxHeight: 40)
                    .background(RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth: 1.5)
                        .foregroundColor(.white))
                    .padding(.top,8)
                    Spacer()
                    HStack{
                        Text("allreadey_account")
                            .foregroundColor(.white)
                        Button {
                            presentation.wrappedValue.dismiss()
                        } label: {
                            Text("sign_in")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }

                     }
                    .padding(.bottom)
                    .frame(height:40)

                }
                .padding(.horizontal)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
