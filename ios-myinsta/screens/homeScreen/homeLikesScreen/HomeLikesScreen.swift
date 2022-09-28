import SwiftUI

struct HomeLikesScreen: View {
    @ObservedObject var likeViewModel = LikesViewModel()
    @EnvironmentObject var sessionStore:SessionStore
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(likeViewModel.items,id: \.self){ item in
                        LikeItem(showingAlert: false, uid: (sessionStore.session?.uid)!, viewModel: likeViewModel, post: item, isLick: false)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("Likes",displayMode: .inline)
        }
        .onAppear{
            likeViewModel.itemsUploadData {
                print(likeViewModel.items.count)
            }
        }
    }
}

struct HomeLikesScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeLikesScreen()
    }
}
