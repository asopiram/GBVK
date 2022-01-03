//
//  GroupSearchAPI.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/21/21.
//

import Foundation
import Alamofire
import SwiftyJSON

//struct GroupSearchDTO {//заглушка на выводимые данные
//    var groupSearch = "bobik"
//}

final class GroupSearchAPI {
    
    var lookForGroup:String = "Music"//тут должна быть связь с поисковой строкой из сториборда
    
    let baseUrl = Session.shared.baseVkUrl
    let userId =  Session.shared.userId
    let accessToken = Session.shared.token
    let version = Session.shared.versionVk
    
    func getGroupSearch(completion: @escaping([GroupSearchDTO])->()) {
        
        let path = "/groups.search"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "q": lookForGroup,
            "type": "group",//group, page, event
            "count": "10",
//            "country_id": "1",
//            "city_id": "1",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in

            //print(response.result)
            //print(response.data?.prettyJSON)
            guard let jsonData = response.data else { return }

            do {
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let friends = try JSONDecoder().decode([GroupSearchDTO].self, from: itemsData)
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
}
