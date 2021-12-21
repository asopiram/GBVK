//
//  GroupsAPI.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/21/21.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Groups {//заглушка
    var group = "bobik"
}

final class GroupsAPI {
    
    let baseUrl = Session.shared.baseVkUrl
    let userId =  Session.shared.userId
    let accessToken = Session.shared.token
    let version = Session.shared.versionVk
    
    func getGroups(completion: @escaping([Groups])->()) {
        
        let path = "/groups.get"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "user_id": userId,
            "extended": "1",
            "count": "10",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in

            //print(response.result)
            print(response.data?.prettyJSON)
//            guard let jsonData = response.data else { return }
//
//            do {
//                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
//                let friends = try JSONDecoder().decode([FriendDTO].self, from: itemsData)
//                completion(friends)
//            } catch {
//                print(error)
//            }
        }
    }
}
