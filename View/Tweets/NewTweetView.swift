//
//  NewTweetView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var isPresented : Bool
    @State var caption :String = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment:.top){
                    Image("itashi")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    TextArea("What's happening?", text: $caption)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: {isPresented.toggle()}, label: {Text("Cancel")
                        .foregroundColor(.blue)
                }),
                trailing: Button(action: {}, label: {Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }))
                Spacer()
                }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
