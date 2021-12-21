//
//  PhotoAPI.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/20/21.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Photo {//заглушка
    var photo = "bobik"
}

final class PhotoAPI {
    
    let baseUrl = Session.shared.baseVkUrl
    let userId =  Session.shared.userId
    let accessToken = Session.shared.token
    let version = Session.shared.versionVk
    
    func getPhotos(completion: @escaping([Photo])->()) {
        
        let path = "/photos.get"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "owner_id": userId,
            "album_id": "profile",
            "photo_sizes": "1",
            "count": "5",
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
