//
//  FirestoreService.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/05/09.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

enum FirestoreError: Error {
    case unknown
    case encodingError
    case decodingError
}

enum FirestoreCollection: String {
    case campaigns
}

final class FirestoreService: DatabaseServiceType {
    private let db = Firestore.firestore()
    
    func fetchDocuments<T: Decodable>(from collection: String, completion: @escaping ((Result<[T], Error>) -> Void)) {
        db.collection(collection).getDocuments { snapshot, error in
            if let error {
                completion(.failure(error))
            } else {
                do {
                    let documents = try snapshot?.documents.compactMap { try $0.data(as: T.self) }
                    completion(.success(documents ?? []))
                } catch {
                    completion(.failure(FirestoreError.decodingError))
                }
            }
        }
    }
    
    func saveDocuments<T: Encodable>(_ document: T, id: String, to collection: String, completion: @escaping ((Result<Void, Error>) -> Void)) {
        let documentReference = db.collection(collection).document(id)
        do {
            try documentReference.setData(from: document) { error in
                if error != nil { completion(.failure(FirestoreError.encodingError)) }
                else { completion(.success(())) }
            }
        } catch {
            completion(.failure(FirestoreError.encodingError))
        }
    }
}
