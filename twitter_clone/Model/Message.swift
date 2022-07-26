//
//  Message.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 30/06/2022.
//

import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
   
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }

    init(user: User, dictionary: [String: Any]) {
        self.user = user
       
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}



struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "back", messageText: "Hey what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "itashi", messageText: "Not much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "itashi", messageText: "How's your family?", isCurrentUser: true),
    .init(id: 3, imageName: "back", messageText: "Good...", isCurrentUser: false),
    .init(id: 4, imageName: "back", messageText: "How's your olympiades?", isCurrentUser: false),
    .init(id: 5, imageName: "itashi", messageText: "I enjoyed it..", isCurrentUser: true),
]
