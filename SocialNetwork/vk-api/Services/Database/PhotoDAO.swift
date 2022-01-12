//
//  PhotoDAO.swift
//  SocialNetwork
//
//  Created by Dmitrii Sharovarov on 12.01.2022.
//

import Foundation
import RealmSwift

// MARK: - PhotoDAO

class PhotoDAO: Object, Codable {
    @objc dynamic var albumID, postID, id, date: Int
    @objc dynamic var text: String
    @objc dynamic var sizes: [Size2]
    @objc dynamic var hasTags: Bool
    @objc dynamic var ownerID: Int
    //@objc dynamic var lat, long: Double?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case postID = "post_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        //case lat, long
    }
}

// MARK: - Size
class Size2: Object, Codable {
    @objc dynamic var width, height: Int
    @objc dynamic var url: String
    @objc dynamic var type: String
}
