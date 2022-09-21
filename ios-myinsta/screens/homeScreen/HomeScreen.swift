import SwiftUI

struct HomeScreen: View {
    @State var tabSelected = 0
    var body: some View {
        TabView(selection: $tabSelected, content: {
            HomeFeedScreen(tabSelection: $tabSelected)
                .font(.system(size: 15,weight: .bold,design: .rounded))
                .tabItem({
                    VStack(spacing:5){
                        Image(systemName: "house")
                        Text("home")
                    }
                }).tag(0)
            
            HomeSearchScreen()
                .font(.system(size: 15,weight: .bold,design: .rounded))
                .tabItem({
                    VStack(spacing:5){
                        Image(systemName: "magnifyingglass")
                        Text("search")
                    }
                }).tag(1)
            
            HomeUploadScreen(tabSelection: $tabSelected)
                .font(.system(size: 15,weight: .bold,design: .rounded))
                .tabItem({
                    VStack(spacing:5){
                        Image(systemName: "camera")
                        Text("upload")
                    }
                }).tag(2)
            
            HomeLikesScreen()
                .font(.system(size: 15,weight: .bold,design: .rounded))
                .tabItem({
                    VStack(spacing:5){
                        Image(systemName: "heart")
                        Text("likes")
                    }
                }).tag(3)
            HomeProfileScreen()
                .font(.system(size: 15,weight: .bold,design: .rounded))
                .tabItem({
                    VStack(spacing:5){
                        Image(systemName: "person")
                        Text("profile")
                    }
                }).tag(4)
        })
        .accentColor(.red.opacity(0.8))
        .onAppear(){
            UIToolbar.appearance().barTintColor = .white
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
