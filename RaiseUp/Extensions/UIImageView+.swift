//
//  UIImageView.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

extension UIImageView {
    static func create(cornerRadius: CGFloat = 6) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray4
        return imageView
    }
}
