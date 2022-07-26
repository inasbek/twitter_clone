//
//  SearchView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 27/06/2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            VStack(alignment: .leading){
                HStack{Spacer()}
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)){ user in
                    HStack{Spacer()}
                    
                    NavigationLink(destination: LazyView(UserProfileView(user: user)), label: {UserCell(user: user)})
                    
                }
            
            }.padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
