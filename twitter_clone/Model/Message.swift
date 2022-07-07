//
//  Message.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 30/06/2022.
//

import Foundation

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
