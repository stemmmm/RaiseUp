//
//  NSObject.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/26.
//

import Foundation

extension NSObject {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
