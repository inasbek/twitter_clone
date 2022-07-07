//
//  ConversationsView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 29/06/2022.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowigNewMessage = false
    @State var showChat = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            NavigationLink(destination: ChatView(),                    isActive: $showChat,
                           label: {})
            
            ScrollView{
                VStack{
                    ForEach(0..<10){ _ in
                        NavigationLink(destination: ChatView(), label: { ConversationCell()
                        })
                    }
                }.padding()
            }
            
            Button(action: {self.isShowigNewMessage.toggle()} ,
                   label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowigNewMessage, content: {
                NewMessageView(show: $isShowigNewMessage, startChat: $showChat)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
