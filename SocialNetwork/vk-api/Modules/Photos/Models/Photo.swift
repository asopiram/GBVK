//
//  Photo.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/20/21.
//

//   let photo = try? newJSONDecoder().decode(Photo.self, from: jsonData)
/*
import Foundation

// MARK: - Photo
struct PhotoContainer: Codable {
    let response: PhotoResponse
}

// MARK: - Response
struct PhotoResponse: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable {
    let albumID, postID, id, date: Int
    let text: String
    let sizes: [Size2]
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

//MARK: - Size2
struct Size2: Codable {
    let width, height: Int
    let url: String
    let type: String
}
*/
