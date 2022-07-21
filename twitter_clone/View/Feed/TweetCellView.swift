//
//  TweetCellView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 22/06/2022.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    let tweet: Tweet
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                KFImage(URL(string: tweet.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(56 / 2)
                .padding(.leading)
                
                VStack(alignment: .leading){
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size : 14, weight: .semibold))
                        
                        Text("@\(tweet.username) •")
                            .foregroundColor(.gray)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    
                    
                    Text(tweet.caption)
                }
            }.padding(.bottom)
                .padding(.trailing)
            
            HStack {
                Button(action: {}, label:{
                    Image(systemName: "bubble.left")
                        .font(.system(size : 16)).frame(width: 32, height: 32)
                })
                Spacer()
                
                Button(action: {}, label:{
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size : 16)).frame(width: 32, height: 32)
                })
                Spacer()
                
                Button(action: {}, label:{
                    Image(systemName: "heart")
                        .font(.system(size : 16)).frame(width: 32, height: 32)
                })
                Spacer()
                
                Button(action: {}, label:{
                    Image(systemName: "bookmark")
                        .font(.system(size : 16)).frame(width: 32, height: 32)
                })
            }
            .foregroundColor(.blue)
            .padding(.horizontal)
            
            Divider()
        }
    }
}

//struct TweetCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCellView()
//    }
//}
