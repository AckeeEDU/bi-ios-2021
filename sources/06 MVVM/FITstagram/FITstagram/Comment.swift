//
//  Comment.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import Foundation

struct Comment: Identifiable, Decodable {
    let id: String
    let author: User
    let text: String
    
//    init(id: String, username: String, text: String) {
//        self.id = id
//        self.username = username
//        self.text = text
//    }
}
