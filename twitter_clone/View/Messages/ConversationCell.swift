//
//  ConversationCell.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 29/06/2022.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message: Message
    var body: some View {
      VStack {
        HStack(spacing: 12){
            KFImage(URL(string: message.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user.fullname)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(message.text)
                    .font(.system(size: 15))
                    .lineLimit(2)
            }
            
            .padding(.trailing)
        }
        Divider()
        }
    }
}

//struct ConversationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversationCell()
//    }
//}
