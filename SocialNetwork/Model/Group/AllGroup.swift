//
//  AllGroups.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 30.11.2021.
//

import Foundation
import UIKit

class AllGroup {
    var AllGroupArray = [GroupInfo]()

    init() {
        setupArray()
    }

    func setupArray() {
        let group1 = GroupInfo(groupName: "AutoParts", groupImage: "AutoParts")
        let group2 = GroupInfo(groupName: "Cafe", groupImage: "Cafe")
        let group3 = GroupInfo(groupName: "Coffe Shop", groupImage: "Coffe Shop")
        let group4 = GroupInfo(groupName: "Crypto", groupImage: "Crypto")
        let group5 = GroupInfo(groupName: "Beverly Bar", groupImage: "Beverly Bar")
        let group6 = GroupInfo(groupName: "College", groupImage: "College")
        let group7 = GroupInfo(groupName: "Pepper Grill & Bar", groupImage: "Pepper Grill & Bar")
        let group8 = GroupInfo(groupName: "Group without Logo", groupImage: "NoLogo")


        AllGroupArray.append(group1)
        AllGroupArray.append(group2)
        AllGroupArray.append(group3)
        AllGroupArray.append(group4)
        AllGroupArray.append(group5)
        AllGroupArray.append(group6)
        AllGroupArray.append(group7)
        AllGroupArray.append(group8)
        
    }
}
