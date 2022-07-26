//
//  TweetActionView.swift
//  twitter_clone
//
//  Created by SI MOHAMMED Sonia-taous (Canal Plus ) on 21/07/2022.
//

import SwiftUI

struct TweetActionView: View{
    let tweet: Tweet
    @ObservedObject var viewModel : TweetActionViewModel
    
    init(tweet: Tweet){
        self.tweet = tweet
        self.viewModel = TweetActionViewModel(tweet: tweet)
    
    }
    
    var body: some View{
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
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikeTweet() : viewModel.likeTweet()
            }, label:{
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size : 16)).frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
            })
            Spacer()
            
            Button(action: {}, label:{
                Image(systemName: "bookmark")
                    .font(.system(size : 16)).frame(width: 32, height: 32)
            })
        }
        .foregroundColor(.blue)
        .padding(.horizontal)
        
    }
}
