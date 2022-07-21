//
//  ContentView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 21/06/2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView{
                    TabView{
                        FeedView()
                            .tabItem{
                                Image(systemName: "house")
                                Text("Home")
                            }
                        SearchView()
                            .tabItem{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        ConversationsView()
                            .tabItem{
                                Image(systemName: "envelope")
                                Text("Messages")
                            }

                    }
                    
                        .navigationBarTitle("Home")
                        .navigationBarItems(leading: Button(action: {
                            viewModel.signout()
                        }, label: {
                            if let user = viewModel.user {
                                KFImage(URL(string: user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(16)

                            }
                        }))
                        .navigationBarTitleDisplayMode(.inline)

                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
