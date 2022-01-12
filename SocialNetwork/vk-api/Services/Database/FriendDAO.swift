//
//  FriendDAO.swift
//  SocialNetwork
//
//  Created by Dmitrii Sharovarov on 12.01.2022.
//

import Foundation
import RealmSwift

// MARK: - FriendDAO

class FriendDAO: Object, Codable {
    @objc dynamic var domain: String
    @objc dynamic var id: Int
    @objc dynamic var photo100: String
    @objc dynamic var lastName: String
    @objc dynamic var photo50: String
    @objc dynamic var trackCode: String?
    let isClosed: Bool?
    @objc dynamic var firstName: String

    enum CodingKeys: String, CodingKey {
        case domain, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
    }
}
