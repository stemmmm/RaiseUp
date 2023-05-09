//
//  FirestoreService.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/05/09.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

protocol FireStoreServiceProtocol {
    func fetchCampaigns() async throws -> [Campaign]
    func saveCampaign(_ campaign: Campaign, completion: @escaping ((Result<Void, Error>) -> Void))
}

final class FirestoreService: FireStoreServiceProtocol {
    private let db = Firestore.firestore()
    private let campaignsCollection = "campaigns"
    
    func fetchCampaigns() async throws -> [Campaign] {
        let snapshot = try await db.collection(campaignsCollection).getDocuments()
        return try snapshot.documents.compactMap { try $0.data(as: Campaign.self) }
    }
    
    func saveCampaign(_ campaign: Campaign, completion: @escaping ((Result<Void, Error>) -> Void)) {
        let documentReference = db.collection(campaignsCollection).document()
        do {
            try documentReference.setData(from: campaign) { error in
                if let error { completion(.failure(error)) }
                else { completion(.success(())) }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
