//
//  CampaignListViewModel.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

final class CampaignListViewModel {
    private let user = User(email: "me@me.com", password: "1234", name: "name")
    
    lazy var campaigns = [
        Campaign(
            title: "Medical Support",
            category: .medical,
            deadline: Date(),
            targetAmount: "5000",
            currentAmount: "3000",
            content: "Medical support for people in need.",
            creator: user
        ),
        Campaign(
            title: "Education Fund",
            category: .education,
            deadline: Date(),
            targetAmount: "10000",
            currentAmount: "7500",
            content: "Raising funds for education.",
            creator: user
        ),
        Campaign(
            title: "Small Business Support",
            category: .business,
            deadline: Date(),
            targetAmount: "15000",
            currentAmount: "8000",
            content: "Supporting small businesses in the community.",
            creator: user
        ),
        Campaign(
            title: "Art Project",
            category: .art,
            deadline: Date(),
            targetAmount: "8000",
            currentAmount: "4500",
            content: "Funding a community art project.",
            creator: user
        ),
        Campaign(
            title: "Social Awareness",
            category: .social,
            deadline: Date(),
            targetAmount: "12000",
            currentAmount: "6000",
            content: "Raising awareness about social issues.",
            creator: user
        ),
        Campaign(
            title: "Social Awareness",
            category: .social,
            deadline: Date(),
            targetAmount: "12000",
            currentAmount: "6000",
            content: "Raising awareness about social issues.",
            creator: user
        ),
        Campaign(
            title: "Personal Development",
            category: .personal,
            deadline: Date(),
            targetAmount: "7000",
            currentAmount: "3500",
            content: "Supporting personal growth and development.",
            creator: user
        ),
        Campaign(
            title: "Community Center",
            category: .community,
            deadline: Date(),
            targetAmount: "25000",
            currentAmount: "12500",
            content: "Building a new community center.",
            creator: user
        ),
        Campaign(
            title: "Educational Scholarships",
            category: .education,
            deadline: Date(),
            targetAmount: "20000",
            currentAmount: "10000",
            content: "Providing scholarships for underprivileged students.",
            creator: user),
        Campaign(
            title: "Healthcare Initiative",
            category: .medical,
            deadline: Date(),
            targetAmount: "30000",
            currentAmount: "15000",
            content: "Improving healthcare facilities in rural areas.",
            creator: user
        ),
        Campaign(
            title: "Environmental Conservation",
            category: .social,
            deadline: Date(),
            targetAmount: "18000",
            currentAmount: "9000",
            content: "Supporting environmental conservation projects.",
            creator: user
        )
    ]
}
