import SwiftUI

struct ItemSearch: View {
    var user:User
    var body: some View {
        HStack {
            Image("image_profile")
                .resizable()
                .frame(maxWidth:45,maxHeight: 45)
                .clipShape(Circle())
                .padding(2)
                .overlay(Circle().stroke(Color.red.opacity(0.7),lineWidth: 2))
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
            Button {
                
            } label: {
                Text("Folowing")
                    .font(Font.system(size: 15))
                    .foregroundColor(.gray.opacity(0.7))
            }
            .padding(.horizontal)
            .padding(.vertical,7)
            .background(RoundedRectangle(cornerRadius: 6)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray.opacity(0.7)))

        }
        .padding(.horizontal,10)
        .padding(.vertical,12)
    }
}

struct ItemSearch_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearch(user: User(uid: "ss", email: "eshmurodovdoston630@gmail.com", displayName: "Dosotnbek Eshmurodov"))
    }
}
