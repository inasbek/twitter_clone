//
//  ChatView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 30/06/2022.
//

import SwiftUI
import Kingfisher

struct ChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var text : String = ""
    
    init(user: User){
        self.user = user
        self.viewModel = ChatViewModel(user:user)
        
    }
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(viewModel.messages){ message in
                        MessageView(message: message)
                    }
                }
            }.padding(.top)
            MessageInputView(text: $text, action: senMessage)
                .padding()
                
            
            
        }.navigationTitle(user.username)
    }
    
    func senMessage()
    {
        viewModel.sendMessage(text)
        text = ""
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
