//
//  ChatView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 30/06/2022.
//

import SwiftUI

struct ChatView: View {
    @State var text : String = ""
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(MOCK_MESSAGES){ message in
                      HStack{
                          if message.isCurrentUser{
                              Spacer()
                                Text(message.messageText)
                                  .padding()
                                  .background(Color.blue)
                                  .clipShape(ChatBubble(isFromCurrentUser: true))
                                  .foregroundColor(.white)
                                  .padding(.horizontal)
                                  
                          }else {
                              HStack(alignment: .bottom){
                                  Image(message.imageName)
                                      .resizable()
                                      .scaledToFill()
                                      .frame(width: 40, height: 40)
                                      .clipShape(Circle())
                                  
                                  Text(message.messageText)
                                    .padding()
                                    .background(Color(.systemGray5))
                                    .clipShape(ChatBubble(isFromCurrentUser: false))
                                    .foregroundColor(.black)
                                    
                                  
                                  
                              }
                              .padding(.horizontal)
                              Spacer()
                                  
                          }
                          
                        
                        }
                    }
                }
            }
            MessageInputView(text: $text)
                .padding()
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
