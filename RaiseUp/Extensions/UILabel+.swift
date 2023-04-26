//
//  UIView+.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

extension UILabel {
    static func create(fontStyle: UIFont.TextStyle, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: fontStyle)
        label.textColor = textColor
        return label
    }
}
