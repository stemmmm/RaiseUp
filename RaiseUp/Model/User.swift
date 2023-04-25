//
//  User.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/10.
//

import Foundation

struct User {
    enum UserType {
        case sponser
        case receiver
    }
    
    let id: UUID
    let email: String
    let password: String
    let name: String
    
    let campaigns: [Campaign]
    let favoriteCampaigns: [Campaign]
}
