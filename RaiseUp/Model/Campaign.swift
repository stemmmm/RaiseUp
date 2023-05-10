//
//  Campaign.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/10.
//

import Foundation

struct Campaign {
    enum Category: String {
        case medical = "의료"
        case education = "교육"
        case business = "비즈니스"
        case social = "사회"
        case art = "예술"
        case personal = "개인"
        case community = "커뮤니티"
    }
    
    let id: UUID
    let createdAt: Date
    let title: String
    let category: Category
    let images: [String]?
    let deadline: Date
    let targetAmount: String
    let currentAmount: String
    let content: String
    let creator: User
    
    init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        title: String,
        category: Category,
        images: [String]? = nil,
        deadline: Date,
        targetAmount: String,
        currentAmount: String,
        content: String,
        creator: User
    ) {
        self.id = id
        self.createdAt = createdAt
        self.title = title
        self.category = category
        self.images = images
        self.deadline = deadline
        self.targetAmount = targetAmount
        self.currentAmount = currentAmount
        self.content = content
        self.creator = creator
    }
}

extension Campaign {
    var leftdays: Int {
        let components = Calendar.current.dateComponents([.day], from: Date(), to: deadline)
        return components.day ?? 0
    }
    
    /// progressView에 전달하는 값
    var progress: Float {
        guard let target = Float(targetAmount),
                let current = Float(currentAmount) else { return 0 }
        return current / target
    }
    
    var percentage: Int { Int(progress * 100) }
}

extension Campaign: Codable { }
extension Campaign.Category: Codable { }
