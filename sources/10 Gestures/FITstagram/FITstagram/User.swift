//
//  Author.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 20.10.2021.
//

import Foundation

typealias Author = User

struct User: Codable {
    let username: String
    let firstName: String?
    let lastName: String?
    let avatar: URL?
    let id: String
}

extension Author {
    static var dummy: Author {
        Author(username: "jan.novak", firstName: "Jan", lastName: "Novák", avatar: nil, id: "1")
    }
}
