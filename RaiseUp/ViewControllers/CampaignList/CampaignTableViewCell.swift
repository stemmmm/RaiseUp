//
//  CampaignTableViewCell.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

final class CampaignTableViewCell: UITableViewCell {
    
    let thumbnailImageView = UIImageView.create()
    let titleLabel = UILabel.create(fontStyle: .body, textColor: .black)
    let categoryLabel = UILabel.create(fontStyle: .subheadline, textColor: .secondaryLabel)
    let percentageLabel = UILabel.create(fontStyle: .footnote, textColor: .systemGreen)
    let leftDaysLabel = UILabel.create(fontStyle: .footnote, textColor: .secondaryLabel)
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = .systemGreen
        return progressView
    }()
    
    private lazy var titleCategoryStackView = UIStackView.create(
        arrangedSubviews: [titleLabel, categoryLabel],
        axis: .vertical,
        spacing: 4
    )
    
    private lazy var percentageLeftDaysStackView = UIStackView.create(
        arrangedSubviews: [percentageLabel, leftDaysLabel],
        axis: .horizontal,
        spacing: 4
    )
    
    private lazy var mainStackView = UIStackView.create(
        arrangedSubviews:  [titleCategoryStackView, percentageLeftDaysStackView],
        axis: .vertical,
        spacing: 16
    )

    // MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutConstants.sixteen),
            thumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutConstants.sixteen),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.sixteen),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.thumbnailImageViewWidth),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.thumbnailImageViewHeight),
            
            mainStackView.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor, constant: LayoutConstants.six),
            mainStackView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -LayoutConstants.six),
            mainStackView.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: LayoutConstants.ten),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutConstants.sixteen),
            
            progressView.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor),
            progressView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutConstants.sixteen)
        ])
    }
}
