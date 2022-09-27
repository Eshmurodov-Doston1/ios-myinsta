import SwiftUI

struct SignUpScreen: View {
    @State var fullName:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var cPassword:String = ""
    @Environment(\.presentationMode) var presentation
    @ObservedObject var signUpViewModel = SignUpViewModel()
    @State var isShowing = false
    @State var messageError = ""
    @EnvironmentObject var sessionStore:SessionStore
    func doSignUp(){
        var result = Utils().validView(email: email, password: password)
        
        if result == nil {
            if cPassword.lowercased() == password.lowercased() {
                signUpViewModel.signUp(email: email, password: password) { isStatus, errorMessage in
                    if errorMessage != nil {
                        isShowing.toggle()
                        messageError = errorMessage ?? "No Data"
                    }
                    if isStatus {
                        var user = User(email: email, displayName: fullName, password: password, imageUrl: "")
                        user.uid = sessionStore.session?.uid
                        signUpViewModel.saveUser(user: user)
                        presentation.wrappedValue.dismiss()
                    }
                    
                }
            }else{
                isShowing.toggle()
                messageError = String(localized: "",comment: "Confirm Password")
            }
        }else {
            isShowing.toggle()
            messageError = result!
        }
    }
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
                        if fullName.isEmpty {
                            isShowing.toggle()
                            messageError = String(localized: "no_fullName",comment: "First Coment")
                        } else if email.isEmpty {
                            isShowing.toggle()
                            messageError = String(localized: "no_email",comment: "Second Coment")
                        } else if password.isEmpty {
                            isShowing.toggle()
                            messageError = String(localized: "no_password",comment: "Three Coment")
                        } else if cPassword.isEmpty {
                            isShowing.toggle()
                            messageError = String(localized: "confirm_password_text",comment: "Four Coment")
                        } else {
                            doSignUp()
                        }
                        
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
                    .alert(isPresented: $isShowing){
                        return Alert(title: Text("Error"), message: Text(messageError), primaryButton: .destructive(Text("Confirm")), secondaryButton: .cancel())
                    }
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
                if signUpViewModel.isLoading {
                    ProgressView("Loading...")
                }
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
