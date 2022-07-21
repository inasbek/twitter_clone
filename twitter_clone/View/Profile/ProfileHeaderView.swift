//
//  ProfileHeaderView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    //@State var selectedFilter: TweetFilterOptions = .tweets
    let user: User
    
    var body: some View {
        VStack{
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(60.0)
                .shadow(color:.black,radius: 10)
            
            Text(user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top,8)
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("ESGI SCHOOL . PARIS")
                .font(.system(size: 14))
                .padding(.top,8)
            
            HStack{
                VStack{
                    Text("79")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("230")
                        .font(.system(size: 16)).bold()
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            
            ProfileActionButton(isCurrentUser: user.isCurrentUser)
            
            //FilterButtonView(selectedOption: $selectedFilter).padding()
            
            Spacer()
        }
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
