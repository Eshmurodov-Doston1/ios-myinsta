import SwiftUI

struct HomeFeedScreen: View {
    @Binding var tabSelection:Int
    @ObservedObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var sessionStore:SessionStore
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(homeViewModel.items,id: \.self){ item in
                        ItemHomePost(showingAlert: false, uid: (sessionStore.session?.uid)!, viewModel: homeViewModel, post: item, isLick: false)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())
                
                if homeViewModel.isLoading {
                    ProgressView{
                        Text("Loading")
                            .font(Font.system(size: 15))
                            .fontWeight(.medium)
                    }
                    
                    .frame(maxWidth:UIScreen.width,maxHeight: UIScreen.height)
                    .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 0))
                    .edgesIgnoringSafeArea(.all)
                }
                
            }.navigationBarItems(trailing: Button(action: {
                tabSelection = 2
            }, label: {
                Image(systemName: "camera")
            }))
            .navigationBarTitle("instagram_text",displayMode: .inline)
        }
        .onAppear{
            let uid = (sessionStore.session?.uid)!
            homeViewModel.apiFeedList(uid: uid)
        }
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSelection: .constant(0))
    }
}
