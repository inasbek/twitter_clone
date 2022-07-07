//
//  ConversationCell.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 29/06/2022.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
      VStack {
        HStack(spacing: 12){
            Image("back")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            VStack(alignment: .leading, spacing: 4) {
                Text("issassou")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("It s really so boring girl i don't like it att all... Want to see it ?")
                    .font(.system(size: 15))
                    .lineLimit(2)
            }
            
            .padding(.trailing)
        }
        Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
