import SwiftUI
import SDWebImageSwiftUI

struct ItemHomePost: View {
    @State var showingAlert:Bool = false
    var uid:String
    var viewModel:HomeViewModel
    var post:Post
    var isLick:Bool=false
    var body: some View {
        VStack{
            HStack{
                if post.imgUser?.isEmpty ?? false{
                    Image("image_profile")
                        .resizable()
                        .frame(maxWidth:45,maxHeight: 45)
                        .clipShape(Circle())
                        .padding(3)
                        .overlay(Circle().stroke(Color.red, lineWidth: 2))
                } else {
                    WebImage(url: URL(string: post.imgUser!))
                        .resizable()
                        .frame(maxWidth:50,maxHeight: 50)
                        .clipShape(Circle())
                        .scaledToFit()
                        .padding(2)
                        .overlay(Circle().stroke(Color.red.opacity(0.7), lineWidth: 2))
                        .foregroundColor(Color.blue.opacity(0.5))
                }

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
                Spacer()
                Image(systemName:"ellipsis")
                    .resizable()
                    .tint(.black)
                    .frame(maxWidth:18,maxHeight: 4)
                    .padding(.trailing,5)
                    .onTapGesture {
                        
                    }
             }
            .padding(.horizontal,10)
            .padding(.top,10)
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .padding(.leading,-20)
                .padding(.trailing,-20)
               
                .frame(maxWidth: UIScreen.width,maxHeight: UIScreen.width)
                .scaledToFit()
                
            
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

struct ItemHomePost_Previews: PreviewProvider {
    static var previews: some View {
        ItemHomePost(showingAlert: false, uid: "11", viewModel: HomeViewModel(), post: Post(postId: "11", caption: "Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah", imgPost: Utils.imageProgrammer), isLick: false)
    }
}
