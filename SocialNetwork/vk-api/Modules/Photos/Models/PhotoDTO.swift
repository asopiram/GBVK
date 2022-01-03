//
//  PhotoDTO.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/22/21.
//

import Foundation


// MARK: - ItemDTO
struct PhotoDTO: Codable {
    let albumID, postID, id, date: Int
    let text: String
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int
    let lat, long: Double?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case postID = "post_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case lat, long
    }
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}
