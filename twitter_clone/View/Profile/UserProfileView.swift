//
//  UserProfileView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter : TweetFilterOptions = .tweets
    let user: User
    @ObservedObject var viewModel : ProfileViewModel
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)){
                    tweet in TweetCellView(tweet: tweet)
                        .padding()
                }
            }
            .navigationTitle(user.username)
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
