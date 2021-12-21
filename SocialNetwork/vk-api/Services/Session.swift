//
//  Session.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/13/21.
//

import Foundation

final class Session {
    
    private init() {}
    
    //Единственный экземпляр который висит в статической памяти
    static let shared = Session()
    
    var token = ""
    var userId = ""
    var versionVk = "5.131"//вынес эти переменные сюда, потому что при изменении версии пришлось бы в каждом файле API поправлять - велика вероятность ошибки
    var baseVkUrl = "https://api.vk.com/method"

}
