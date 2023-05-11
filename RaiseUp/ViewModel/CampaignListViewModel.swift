//
//  CampaignListViewModel.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

final class CampaignListViewModel {
    private let user: User
    private let firestoreService: DatabaseServiceType
    private(set) var campaigns: [Campaign] = []
    
    init(user: User = User(email: "email", password: "1234", name: "name"), firestoreService: DatabaseServiceType) {
        self.user = user
        self.firestoreService = firestoreService
    }
    
    func fetchCampaigns(completion: @escaping ((Result<Void, Error>) -> Void)) {
        firestoreService.fetchDocuments(from: FirestoreCollection.campaigns.rawValue) { [weak self] (result: Result<[Campaign], Error>) in
            switch result {
            case .success(let campaigns):
                self?.campaigns = campaigns
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func saveCampaign(_ campaign: Campaign, id: String?, completion: @escaping ((Result<Void, Error>) -> Void)) {
        let id = id ?? UUID().uuidString
        firestoreService.saveDocuments(campaign, id: id, to: FirestoreCollection.campaigns.rawValue, completion: completion)
    }
}
