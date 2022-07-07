//
//  UserCell.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 29/06/2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
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
                
                Text("Inas Bekkouche")
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
