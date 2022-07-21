//
//  FeedView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 21/06/2022.
//

import SwiftUI

struct FeedView: View {
    @State var isShowigNewTweet = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                VStack{
                    ForEach(viewModel.tweets){ tweet in
                        TweetCellView(tweet: tweet)
                    }
                }.padding()
            }
            
            Button(action: {
                isShowigNewTweet.toggle()
                
            } ,
                   label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowigNewTweet, content: {
                NewTweetView(isPresented: $isShowigNewTweet)
            })
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
