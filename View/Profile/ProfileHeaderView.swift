//
//  ProfileHeaderView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack{
            Image("back")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(60.0)
                .shadow(color:.black,radius: 10)
            
            Text("Inas Bekkouche")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top,8)
            
            Text("@issassou")
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
            
            ProfileActionButton(isCurrentUser: false)
            
            Spacer()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
