import SwiftUI
import SDWebImageSwiftUI
struct ItemProfile: View {
   
    var uid:String?
    var profileViewModel:ProfileViewModel
    @State var showingAlert:Bool = false
    var post:Post
    var length:CGFloat
    var body: some View {
        VStack(alignment:.center,spacing:0){
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .frame(maxWidth:length,maxHeight:length)
                .scaledToFit()
            VStack(spacing:0){
                Text(post.displayName!)
                    .font(Font.system(size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth:length)
                    .lineLimit(2)
                    .padding(.horizontal,10)
                    .padding(.top,10)
               
                Text(post.caption!)
                    .font(Font.system(size: 13))
                    .fontWeight(.medium)
                    .padding(.top,6)
                    .padding(.horizontal)
                    .frame(maxWidth:length)
                    
                    .lineLimit(2)
            } 
               
        }
    }
}

struct ItemProfile_Previews: PreviewProvider {
    static var previews: some View {
        ItemProfile(profileViewModel: ProfileViewModel(), post:  Post(postId: "ii", caption: "Blah Blah Blah", imgPost: Utils.imageProgrammer), length: UIScreen.width)
    }
}
