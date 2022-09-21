import SwiftUI

struct HomeFeedScreen: View {
    @Binding var tabSelection:Int
    var body: some View {
        NavigationView{
            ZStack{
                
            }.navigationBarItems(trailing: Button(action: {
                tabSelection = 2
            }, label: {
                Image(systemName: "camera")
            }))
            .navigationBarTitle("instagram_text",displayMode: .inline)
        }
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSelection: .constant(0))
    }
}
