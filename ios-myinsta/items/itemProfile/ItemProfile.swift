import SwiftUI
import SDWebImageSwiftUI
struct ItemProfile: View {
    var post:Post
    var length:CGFloat
    var body: some View {
        VStack(alignment:.leading,spacing:0){
            WebImage(url: URL(string: post.imgUrl!))
                .resizable()
                .frame(maxWidth:length,maxHeight:length)
                .scaledToFit()
            VStack(spacing:0){
                Text(post.title!)
                    .font(Font.system(size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth:length)
                    .lineLimit(2)
                    .padding(.horizontal,10)
                    .padding(.top,10)
               
                Text(post.content!)
                    .font(Font.system(size: 13))
                    .fontWeight(.medium)
                    .padding(.top,6)
                    .padding(.horizontal)
                    .frame(maxWidth:length)
                    
                    .lineLimit(2)
            }
            .padding(.horizontal,10)
            
               
        }
    }
}

struct ItemProfile_Previews: PreviewProvider {
    static var previews: some View {
        ItemProfile(post: Post(title: "Dostonbek", content: "Blah Balh Blah Blah", imgUrl: Utils.imageProgrammer), length: UIScreen.width)
    }
}
