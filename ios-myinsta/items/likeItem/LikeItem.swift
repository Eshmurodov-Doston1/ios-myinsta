import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct LikeItem: View {
    @State var showingAlert:Bool = false
    var uid:String
    var viewModel:LikesViewModel
    var post:Post
    var isLick:Bool=false
    var body: some View {
        VStack{
            HStack{
                Image("image_profile")
                    .resizable()
                    .frame(maxWidth:45,maxHeight: 45)
                    .clipShape(Circle())
                    .padding(3)
                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
                VStack(alignment:.leading,spacing:3){
                    Text(post.displayName!)
                        .foregroundColor(.black)
                        .font(Font.system(size: 18))
                        .fontWeight(.bold)
                    Text(post.time!)
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .font(Font.system(size: 15))
                        .lineLimit(1)
                }
                .padding(.horizontal,5)
                Button {
                    
                } label: {
                    Image(systemName:"ellipsis")
                        .resizable()
                        .tint(.black)
                        .frame(maxWidth:18,maxHeight: 4)
                }
                .padding(.trailing,5)
            }
            .padding(.horizontal,5)
            .padding(.top,10)
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .scaledToFit()
                .padding(.leading,-20)
                .padding(.trailing,-20)
                .frame(width: UIScreen.width)
            
            HStack(spacing:10){
                Button {
                    
                } label: {
                    Image(systemName: isLick ? "suit.heart.fill":"suit.heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(isLick ? .red : .black)
                        .frame(width: 20, height: 20, alignment: .center)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                        .tint(.black)
                }
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                        .tint(.black)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName:"bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 20, alignment: .center)
                        .tint(.black)
                }
            }
            .padding(.horizontal,8)
            
            HStack{
                Text(post.caption!)
                    .font(Font.system(size: 15))
                    .foregroundColor(.black)
                    .lineLimit(2)
                Spacer()
            }
            .padding(.horizontal,8)
            .padding(.bottom,10)
        }
    }
}

struct LikeItem_Previews: PreviewProvider {
    static var previews: some View {
        LikeItem(showingAlert: false, uid: "11", viewModel: LikesViewModel(), post: Post(postId: "11", caption: "Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah", imgPost: Utils.imageProgrammer), isLick: false)
    }
}
