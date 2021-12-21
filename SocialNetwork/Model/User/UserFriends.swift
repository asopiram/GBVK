//
//  UserFriends.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 29.11.2021.
//

import Foundation
import UIKit

class UserFriends {
    
    var UserFriendsArray = [UserInfo]()

    init() {
        setupArray()
    }

    func setupArray() {
        let user1 = UserInfo(userName: "Дурной", userImage: "Дурной")
        let user2 = UserInfo(userName: "Беспомощный", userImage: "Беспомощный")
        let user3 = UserInfo(userName: "Задорный", userImage: "Задорный")
        let user4 = UserInfo(userName: "Серьезный", userImage: "Серьезный")
        let user5 = UserInfo(userName: "Сопротивляка", userImage: "NoPhoto")

        
        UserFriendsArray.append(user1)
        UserFriendsArray.append(user2)
        UserFriendsArray.append(user3)
        UserFriendsArray.append(user4)
        UserFriendsArray.append(user5)
    }
}
