//
//  Author.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 20.10.2021.
//

import Foundation

struct Author: Codable {
    let username: String
    let firstName: String
    let lastName: String
    let id: String
}

extension Author {
    static var dummy: Author {
        Author(username: "jan.novak", firstName: "Jan", lastName: "Novák", id: "1")
    }
}
