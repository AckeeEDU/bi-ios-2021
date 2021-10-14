//
//  Post.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/5/21.
//

import Foundation

struct Post: Identifiable {
    let id: String
    let username: String
    let likes: Int
    let description: String
    let comments: Int
}
