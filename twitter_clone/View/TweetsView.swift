//
//  TweetsView.swift
//  twitter_clone
//
//  Created by SI MOHAMMED Sonia-taous (Canal Plus ) on 25/07/2022.
//

import SwiftUI


struct TweetsView: View{
    @ObservedObject var viewModel = TweeetsDatasourceWebservices()
    var datasets : [TweetsDatasource] = []
    
    var body: some View {
        ZStack{
            Button(action: {
                print("Sonia \(viewModel.fetchDatasource(completion: {tweet in print(tweet)}))")
            }, label: {
                Text("Call API")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(width: 360, height: 50)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
            })
        }
       
    }
}


