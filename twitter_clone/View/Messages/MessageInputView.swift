//
//  MessageInputView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 30/06/2022.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var text : String
    var body: some View {
        HStack{
            TextField("Message...", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            Button(action: {}, label: { Text("send") })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(text: .constant("Message..."))
    }
}
