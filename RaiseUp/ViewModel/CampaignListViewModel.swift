//
//  CampaignListViewModel.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

final class CampaignListViewModel {
    private let user: User
    private let databaseService: DatabaseServiceType
    private(set) var campaigns: [Campaign] = []
    
    var onCampaignsUpdated: (() -> Void)?
    
    init(user: User = User(email: "email", password: "1234", name: "name"), databaseService: DatabaseServiceType) {
        self.user = user
        self.databaseService = databaseService
    }
    
    func fetchCampaigns() {
        databaseService.fetchDocuments(from: FirestoreCollection.campaigns.rawValue) { [weak self] (result: Result<[Campaign], Error>) in
            switch result {
            case .success(let campaigns):
                self?.campaigns = campaigns
                self?.onCampaignsUpdated?()
            case .failure(let error):
                // TODO: 에러 처리
                print(error)
            }
        }
    }
    
    func saveCampaign(_ campaign: Campaign, id: String?, completion: @escaping ((Result<Void, Error>) -> Void)) {
        let id = id ?? UUID().uuidString
        databaseService.saveDocuments(campaign, id: id, to: FirestoreCollection.campaigns.rawValue, completion: completion)
    }
}
