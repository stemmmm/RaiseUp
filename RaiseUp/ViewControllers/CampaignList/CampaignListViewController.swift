//
//  CampaignListViewController.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

final class CampaignListViewController: UITableViewController {
    
    private let viewModel = CampaignListViewModel(databaseService: FirestoreService())
    
    private let loadingIndicator = UIActivityIndicatorView(style: .large)
    private let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CampaignTableViewCell.self, forCellReuseIdentifier: CampaignTableViewCell.reuseIdentifier)
        
        setupNavigationItems()
        setupLoadingIndicator()
        setupRefreshControl()
        
        viewModel.fetchCampaigns()
        viewModel.onCampaignsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.loadingIndicator.stopAnimating()
                self?.refreshController.endRefreshing()
            }
        }
    }
    
    private func setupNavigationItems() {
        let logoButton = UIBarButtonItem.create(image: UIImage(named: "logo.black"), target: self, action: #selector(logoButtonTapped))
        let searchButton = UIBarButtonItem.create(image: UIImage(systemName: "magnifyingglass"), target: self, action: #selector(searchButtonTapped))
        let filterButton = UIBarButtonItem.create(image: UIImage(systemName: "slider.horizontal.3"), target: self, action: #selector(filterButtonTapped))
        let notificationButton = UIBarButtonItem.create(image: UIImage(systemName: "bell"), target: self, action: #selector(notificationButtonTapped))
        navigationItem.leftBarButtonItem = logoButton
        navigationItem.rightBarButtonItems = [notificationButton, filterButton, searchButton]
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
        
        loadingIndicator.startAnimating()
    }
    
    private func setupRefreshControl() {
        refreshController.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshController
    }
    
    @objc private func logoButtonTapped() { }
    
    @objc private func searchButtonTapped() { }
    
    @objc private func filterButtonTapped() { }
    
    @objc private func notificationButtonTapped() { }
    
    @objc private func refreshData() { viewModel.fetchCampaigns() }
}

// MARK: - Data source
extension CampaignListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.campaigns.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CampaignTableViewCell.reuseIdentifier, for: indexPath) as? CampaignTableViewCell else { return UITableViewCell() }
        
        let campaign = viewModel.campaigns[indexPath.row]
        // TODO: 이미지 처리
        cell.titleLabel.text = campaign.title
        cell.categoryLabel.text = campaign.category.rawValue
        cell.percentageLabel.text = "\(campaign.percentage)%"
        cell.leftDaysLabel.text = "\(campaign.leftdays)일 남음"
        cell.progressView.progress = campaign.progress
        
        return cell
    }
}

// MARK: - Delegate
extension CampaignListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { LayoutConstants.cellHeight }
}
