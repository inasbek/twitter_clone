//
//  ContentView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 21/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
