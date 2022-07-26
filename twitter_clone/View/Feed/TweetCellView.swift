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
        VStack(alignment: .leading){
            HStack(alignment: .top,spacing: 12) {
                KFImage(URL(string: tweet.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(56 / 2)
                .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size : 14, weight: .semibold))
                            .foregroundColor(.black)
                        Text("@\(tweet.username) •")
                            .foregroundColor(.gray)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    Text(tweet.caption)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            

            TweetActionView(tweet: tweet)
            Divider()
        }
        .padding(.leading, -16)
    }
}

//struct TweetCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCellView()
//    }
//}
