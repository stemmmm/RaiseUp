//
//  User.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/10.
//

import Foundation

struct User {
    let id: UUID
    
    let email: String
    let password: String
    let name: String
    let campaigns: [Campaign]?
    let favoriteCampaigns: [Campaign]?
    
    init(
        id: UUID = UUID(),
        email: String,
        password: String,
        name: String,
        campaigns: [Campaign]? = nil,
        favoriteCampaigns: [Campaign]? = nil
    ) {
        self.id = id
        self.email = email
        self.password = password
        self.name = name
        self.campaigns = campaigns
        self.favoriteCampaigns = favoriteCampaigns
    }
}

extension User: Codable { }
