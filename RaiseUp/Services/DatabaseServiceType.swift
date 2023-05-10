//
//  DatabaseServiceType.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/05/10.
//

protocol DatabaseServiceType {
    func fetchDocuments<T: Decodable>(
        from collection: String,
        completion: @escaping ((Result<[T], Error>) -> Void)
    )
    
    func saveDocuments<T: Encodable>(
        _ document: T,
        id: String,
        to collection: String,
        completion: @escaping ((Result<Void, Error>) -> Void)
    )
}
