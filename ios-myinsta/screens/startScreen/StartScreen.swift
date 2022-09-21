import SwiftUI

struct StartScreen: View {
    @EnvironmentObject var sessionStore:SessionStore
    var body: some View {
        VStack{
            if sessionStore.session != nil{
                HomeScreen()
            }else{
                SignInScreen()
            }
        }
        .onAppear{
            sessionStore.listener()
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
