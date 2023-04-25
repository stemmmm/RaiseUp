//
//  Campaign.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/10.
//

import UIKit

struct Campaign {
    enum Category {
        case medical
        case education
        case business
        case social
        case art
        case personal
        case community
    }
    
    let id: UUID
    let title: String
    let category: Category
    let images: [UIImage]
    let deadline: Date
    let targetAmount: String
    let currentAmount: String
    let content: String
    let creator: User
    let createdAt: Date
}
