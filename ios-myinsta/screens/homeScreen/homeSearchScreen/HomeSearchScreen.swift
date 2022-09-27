import SwiftUI

struct HomeSearchScreen: View {
    @State var search:String = ""
    @ObservedObject var searchViewModel = SearchViewModel()
    @EnvironmentObject var sessionStore:SessionStore
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
                            if item.uid != sessionStore.session?.uid! {
                                ItemSearch(user: item)
                                    .listRowInsets(EdgeInsets())
                                    .onAppear{
                                        print(item.uid)
                                        print((sessionStore.session?.uid)!)
                                    }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                       
                }
                if searchViewModel.isLoading {
                    ProgressView{
                        Text("Loading....")
                            .font(Font.system(size: 15))
                            .fontWeight(.medium)
                    }
                }
            }
            .navigationBarTitle("Search",displayMode: .inline)
        }
        .onAppear{
            searchViewModel.getItemList(keyword: search) {
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
