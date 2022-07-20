//
//  ContentView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 21/06/2022.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
//        Group {
//            if viewModel.userSession != nil {
//                NavigationView{
//                    TabView{
//                        FeedView()
//                            .tabItem{
//                                Image(systemName: "house")
//                                Text("Home")
//                            }
//                        SearchView()
//                            .tabItem{
//                                Image(systemName: "magnifyingglass")
//                                Text("Search")
//                            }
//                        ConversationsView()
//                            .tabItem{
//                                Image(systemName: "envelope")
//                                Text("Messages")
//                            }
//
//                    }
//                    
//                        .navigationBarTitle("Home")
//                        .navigationBarTitleDisplayMode(.inline)
//
//                }
//            } else {
//                LoginView()
//            }
//        }
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
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
