//
//  ProfileActionButton.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI

struct ProfileActionButton: View {
    @ObservedObject var viewModel : ProfileViewModel
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            })
            .cornerRadius(20)
        }else {
            HStack {
                Button(action: {
                    viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(viewModel.user.isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                })
                .cornerRadius(20)
                
//                Button(action: {}, label: {
//                    Text("Message")
//                        .frame(width: 180, height: 40)
//                        .background(Color.purple)
//                        .foregroundColor(Color.white)
//                })
                NavigationLink(destination: ChatView(user: viewModel.user), label: {
                                        Text("Message")
                                            .frame(width: 180, height: 40)
                                            .background(Color.purple)
                                            .foregroundColor(Color.white)
                })
                .cornerRadius(20)
            }
        }
        
    }
}

//struct ProfileActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButton(isCurrentUser: false)
//    }
//}
