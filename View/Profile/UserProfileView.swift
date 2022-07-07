//
//  UserProfileView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter : TweetFilterOptions = .tweets
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView()
                
                FilterButtonView(selectedOption: $selectedFilter)
                
                ForEach(0..<9){
                    tweet in TweetCellView()
                }
            }
            .navigationTitle("issassou")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
