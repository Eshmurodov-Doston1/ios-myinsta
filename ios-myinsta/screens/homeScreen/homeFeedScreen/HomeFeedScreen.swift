import SwiftUI

struct HomeFeedScreen: View {
    @Binding var tabSelection:Int
    @ObservedObject var homeViewModel = HomeViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(homeViewModel.items,id: \.self){ item in
                        ItemHomePost(post: item,isLick: false)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())
            }.navigationBarItems(trailing: Button(action: {
                tabSelection = 2
            }, label: {
                Image(systemName: "camera")
            }))
            .navigationBarTitle("instagram_text",displayMode: .inline)
        }
        .onAppear{
            homeViewModel.itemsUploadData {
                print(homeViewModel.items.count)
            }
        }
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSelection: .constant(0))
    }
}
