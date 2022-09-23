import SwiftUI

struct HomeSearchScreen: View {
    @State var search:String = ""
    @ObservedObject var searchViewModel = SearchViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    TextField("Search...", text: $search)
                        .frame(maxWidth:.infinity,maxHeight: 40)
                        .padding(.horizontal,6)
                        .background(RoundedRectangle(cornerRadius: 6)
                            .stroke(lineWidth: 1.5)
                            .foregroundColor(.gray.opacity(0.6)))
                        .padding(.horizontal,8)
                        .font(Font.system(size: 16))
                    List{
                        ForEach(searchViewModel.items,id: \.self){ item in
                            ItemSearch(user: item)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .listStyle(PlainListStyle())
                       
                }
            }
            .navigationBarTitle("Search",displayMode: .inline)
        }
        .onAppear{
            searchViewModel.getItemList {
                print(searchViewModel.items.count)
            }
        }
    }
}

struct HomeSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchScreen()
    }
}
