//
//  CampaignListViewController.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

final class CampaignListViewController: UITableViewController {

    private let viewModel = CampaignListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Registration
        tableView.register(CampaignTableViewCell.self, forCellReuseIdentifier: CampaignTableViewCell.reuseIdentifier)
    }
}

// MARK: - Data source
extension CampaignListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.campaigns.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CampaignTableViewCell.reuseIdentifier, for: indexPath) as? CampaignTableViewCell else { return UITableViewCell() }
        
        let campaign = viewModel.campaigns[indexPath.row]
        cell.thumbnailImageView.image = campaign.images?.first
        cell.titleLabel.text = campaign.title
        cell.categoryLabel.text = campaign.category.rawValue
        cell.percentageLabel.text = "\(campaign.percentage)%"
        cell.leftDaysLabel.text = "\(campaign.leftdays)일 남음"
        cell.progressView.progress = campaign.progress
        
        return cell
    }
}
