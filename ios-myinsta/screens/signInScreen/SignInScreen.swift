import SwiftUI

struct SignInScreen: View {
    @State var email:String = ""
    @State var password:String = ""
    @ObservedObject var signInVieModel = SignInViewModel()
    @EnvironmentObject var sessionStore:SessionStore
    @State var isShowing = false
    @State var messageError = ""
    func doSignIn(){
        signInVieModel.signIns(email: email, password: password, complation: { (result,error) in
            if error != nil {
                isShowing.toggle()
                messageError = error!
            }
            if result {
               
            } else {
               
            }
        })
    }
    
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
                        if email.isEmpty {
                            isShowing.toggle()
                            messageError = String(localized: "no_email",comment: "Correct message")
                        }else if password.isEmpty {
                            isShowing.toggle()
                            messageError = String(localized: "no_password",comment: "Correct message")
                        } else {
                            doSignIn()
                        }
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
                    .alert(isPresented: $isShowing){
                        return Alert(title: Text("Error"), message: Text(messageError), primaryButton: .destructive(Text("Confirm")), secondaryButton: .cancel())
                    }
                    
                    
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
                if signInVieModel.isLoading {
                    ProgressView("Loading...")
                }
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
