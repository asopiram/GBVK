//
//  UserInfo.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 29.11.2021.
//

import Foundation
import UIKit


class UserInfo {
    
    
    var userName: String
    var userImage: String
    
    init (userName: String, userImage: String) {
        self.userName = userName
        self.userImage = userImage
        
    }
}
  
extension UserInfo: Comparable {// с помощью расширения класса сортируем наши экземпляры
    static func == (lhs: UserInfo, rhs: UserInfo) -> Bool {
        return lhs.userName == rhs.userName
    
    }
    
    static func < (lhs: UserInfo, rhs: UserInfo) -> Bool{
        return lhs.userName < rhs.userName
    }
}
