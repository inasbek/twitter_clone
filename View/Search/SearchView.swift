//
//  SearchView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 27/06/2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            VStack(alignment: .leading){
                HStack{Spacer()}
                ForEach(0..<10){ _ in
                    HStack{Spacer()}
                    
                    NavigationLink(destination: UserProfileView(), label: {UserCell()})
                    
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
