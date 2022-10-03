import SwiftUI
import SDWebImageSwiftUI

struct ItemSearch: View {
    var user:User
    var searchViewModel:SearchViewModel
    var uid:String
    @State var isFolowingText:String = "Folow"
    var body: some View {
        HStack {
            
            if user.imageUrl?.isEmpty ?? false {
                Image("image_profile")
                    .resizable()
                    .frame(maxWidth:45,maxHeight: 45)
                    .clipShape(Circle())
                    .padding(2)
                    .overlay(Circle().stroke(Color.red.opacity(0.7),lineWidth: 2))
            }else {
                WebImage(url: URL(string: user.imageUrl!))
                    .resizable()
                    .frame(maxWidth:45,maxHeight: 45)
                    .clipShape(Circle())
                    .padding(2)
                    .overlay(Circle().stroke(Color.red.opacity(0.7),lineWidth: 2))
            }

            VStack(alignment:.leading,spacing: 2){
                Text(user.displayName!)
                    .fontWeight(.bold)
                    .font(Font.system(size: 15))
                    .lineLimit(1)
                    .foregroundColor(.black)
                Text(user.email!)
                    .font(Font.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
            Text(isFolowingText)
                .font(Font.system(size: 15))
                .foregroundColor(.gray.opacity(0.7))
                .padding(.horizontal)
                .padding(.vertical,7)
                .background(RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray.opacity(0.7)))
                .onTapGesture {
                    if user.isFolowed {
                        isFolowingText = "Folowing"
                        searchViewModel.apiUnFolowUser(uid:uid,to:user)
                    } else {
                        isFolowingText = "Folow"
                        searchViewModel.apiFolowUser(uid:uid,to:user)
                    }
                }
            

        }
        .padding(.horizontal,10)
        .padding(.vertical,12)
    }
}

struct ItemSearch_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearch(user: User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"),searchViewModel: SearchViewModel(),uid: "1")
    }
}
