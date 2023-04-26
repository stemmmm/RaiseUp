//
//  UIStackView+.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

extension UIStackView {
    static func create(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.spacing = spacing
        return stackView
    }
}
