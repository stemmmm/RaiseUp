//
//  UIBarButtonItem+.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/26.
//

import UIKit

extension UIBarButtonItem {
    static func create(image: UIImage?, target: Any?, action: Selector) -> UIBarButtonItem {
        var configuration = UIButton.Configuration.plain()
        configuration.image = image
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 0)
        configuration.buttonSize = .medium
        
        let button = UIButton(configuration: configuration)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = .black
        
        return UIBarButtonItem(customView: button)
    }
}
