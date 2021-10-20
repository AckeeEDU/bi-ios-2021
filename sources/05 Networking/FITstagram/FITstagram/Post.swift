//
//  Post.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/5/21.
//

import Foundation

struct Post: Identifiable {
    let id: String
    let author: Author
    let likes: Int
    let photos: [URL]
    let description: String
    let comments: Int
}

extension Post: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case likes
        case photos
        case description = "text"
        case comments = "numberOfComments"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        author = try container.decode(Author.self, forKey: .author)
        let likes = try container.decode([Author].self, forKey: .likes)
        self.likes = likes.count
        photos = try container.decode([URL].self, forKey: .photos)
        description = try container.decode(String.self, forKey: .description)
        comments = try container.decode(Int.self, forKey: .comments)
    }
}
