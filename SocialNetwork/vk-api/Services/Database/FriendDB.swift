//
//  FriendDAO.swift
//  SocialNetwork
//
//  Created by Dmitrii Sharovarov on 12.01.2022.
//

import Foundation
import RealmSwift

// MARK: - FriendsDAO + DB

class FriendsDAO: Object, Codable {
    @objc dynamic var lastName = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var photo50: String = ""
    @objc dynamic var photo100: String = ""
    @objc dynamic var trackCode: String?
    @objc dynamic var firstName: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case firstName = "first_name"
    }
}


final class FriendsDB {
    
    init() {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 9)
    }
    
    func save(_ items: [FriendsDAO]) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(items)
        }
        guard  let url = realm.configuration.fileURL else { return }
        print(url)
    }
    
    func fetch() -> Results<FriendsDAO> {
        let realm = try! Realm()
        
        let friends: Results<FriendsDAO> = realm.objects(FriendsDAO.self)
        return friends
    }
    
    func deleteAll() {
        let realm = try! Realm()
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    func delete(_ item: FriendsDAO) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
