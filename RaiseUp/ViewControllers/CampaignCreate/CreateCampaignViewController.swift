//
//  CreateCampaignViewController.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

final class CreateCampaignViewController: UITableViewController {
    
    private let addImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .systemGray
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(addImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let titleTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "글 제목"
        return textfield
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        return label
    }()
    
    private let categoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("카테고리 선택", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var categoryStackView = UIStackView.create(
        arrangedSubviews: [categoryLabel, categoryButton],
        axis: .horizontal,
        spacing: 20
    )
    
    private let targetAmountTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "₩ 목표 금액"
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    private let deadlineLabel: UILabel = {
        let label = UILabel()
        label.text = "마감 기한"
        return label
    }()
    
    private let deadlineDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    private lazy var deadlineStackView = UIStackView.create(
        arrangedSubviews: [deadlineLabel, deadlineDatePicker],
        axis: .horizontal,
        spacing: 20
    )
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .preferredFont(forTextStyle: .body)
        textView.text = "캠페인과 관련된 상세 내용을 작성해주세요."
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupNavigationItems()
        
        targetAmountTextField.delegate = self
    }
    
    private func setupNavigationItems() {
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        let completeButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(completeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.title = "캠페인 생성하기"
        navigationItem.rightBarButtonItem = completeButton
    }
    
    @objc private func closeButtonTapped() { dismiss(animated: true, completion: nil) }
    @objc private func completeButtonTapped() { dismiss(animated: true, completion: nil) }
    
    @objc private func addImageButtonTapped() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc private func categoryButtonTapped() {
        let alertController = UIAlertController(title: "카테고리 선택하기", message: nil, preferredStyle: .actionSheet)
        
        for category in Campaign.Category.allCases {
            let action = UIAlertAction(title: category.rawValue, style: .default) { [weak self] _ in
                self?.categoryButton.setTitle(category.rawValue, for: .normal)
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension CreateCampaignViewController {
    override func numberOfSections(in tableView: UITableView) -> Int { 6 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
}

extension CreateCampaignViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 110
        case 5: return 300
        default: return 60
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.contentView.addSubview(addImageButton)
            NSLayoutConstraint.activate([
                addImageButton.widthAnchor.constraint(equalToConstant: 72),
                addImageButton.heightAnchor.constraint(equalToConstant: 72),
                addImageButton.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                addImageButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
        case 1:
            cell.contentView.addSubview(titleTextField)
            NSLayoutConstraint.activate([
                titleTextField.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                titleTextField.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                titleTextField.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
        case 2:
            cell.contentView.addSubview(categoryStackView)
            NSLayoutConstraint.activate([
                categoryStackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                categoryStackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                categoryStackView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
        case 3:
            cell.contentView.addSubview(targetAmountTextField)
            NSLayoutConstraint.activate([
                targetAmountTextField.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                targetAmountTextField.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                targetAmountTextField.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
        case 4:
            cell.contentView.addSubview(deadlineStackView)
            NSLayoutConstraint.activate([
                deadlineStackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                deadlineStackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                deadlineStackView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
        case 5:
            cell.contentView.addSubview(contentTextView)
            NSLayoutConstraint.activate([
                contentTextView.heightAnchor.constraint(equalToConstant: 260),
                contentTextView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                contentTextView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                contentTextView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
        default: break
        }
        
        return cell
    }
}

// MARK: Image picker controller delegate
extension CreateCampaignViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.addImageButton.setImage(image, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreateCampaignViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
