//
//  ViewController.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 9.06.2022.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    private let titleDescriptionLabel = UILabel()
    private let contentDescriptionLabel = UILabel()
    private let dateDescriptionLabel = UILabel()

    private let titleTextField = UITextField()
    private let contentTextField = UITextField()
    private let datePicker = UIDatePicker()
    
    private var operation = ""
    
    private let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: operation, style: .plain, target: self, action: #selector(toDoAction))

        configure()
    }
    
    func setEditScene(item: ToDoItem) {
        navigationItem.title = "Edit"
        operation = "Update"
        
        viewModel.toDoItem = item
        
        titleTextField.text = item.title
        contentTextField.text = item.content
        datePicker.date = item.date.getDateFromString() ?? Date()
    }
    
    func setCreateScene() {
        navigationItem.title = "Create"
        operation = "Add"
    }
    
    private func configure() {
        configureDatePicker()
        configureTitleField()
        configureDetailField()
        configureTitleDescription()
        configureDetailDescription()
        configureDateDescription()
        makeAllConstraints()
    }
    
    private func configureDatePicker() {
        view.addSubview(datePicker)
        datePicker.locale = .current
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact
    }
    private func configureTitleField() {
        view.addSubview(titleTextField)
        titleTextField.font = UIFont.systemFont(ofSize: 20)
        titleTextField.placeholder = "Enter Title"
        titleTextField.borderStyle = .roundedRect
    }
    private func configureDetailField() {
        view.addSubview(contentTextField)
        contentTextField.font = UIFont.systemFont(ofSize: 20)
        contentTextField.placeholder = "Enter Detail"
        contentTextField.borderStyle = .roundedRect
        
    }
    private func configureTitleDescription() {
        view.addSubview(titleDescriptionLabel)
        titleDescriptionLabel.text = "Title"
        titleDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleDescriptionLabel.textColor = .lightGray
    }
    private func configureDetailDescription() {
        view.addSubview(contentDescriptionLabel)
        contentDescriptionLabel.text = "Detail"
        contentDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 12)
        contentDescriptionLabel.textColor = .lightGray
    }
    private func configureDateDescription() {
        view.addSubview(dateDescriptionLabel)
        dateDescriptionLabel.text = "Date and Time"
        dateDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 12)
        dateDescriptionLabel.textColor = .lightGray
    }
    
    private func makeAllConstraints() {
        titleTextField.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(32)
            $0.trailing.equalTo(-32)
        }
        titleDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(32)
            $0.bottom.equalTo(titleTextField.snp.top).offset(-4)
        }
        contentTextField.snp.makeConstraints{
            $0.top.equalTo(titleTextField.snp.bottom).offset(32)
            $0.leading.equalTo(32)
            $0.trailing.equalTo(-32)
        }
        contentDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(32)
            $0.bottom.equalTo(contentTextField.snp.top).offset(-4)
        }
        datePicker.snp.makeConstraints{
            $0.top.equalTo(contentTextField.snp.bottom).offset(32)
            $0.leading.equalTo(32)
        }
        dateDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(32)
            $0.bottom.equalTo(datePicker.snp.top).offset(-4)
        }
    }
    
    @objc private func toDoAction() {
        let title = titleTextField.text ?? viewModel.toDoItem.title
        let content = contentTextField.text ?? viewModel.toDoItem.content
        let date = datePicker.date.getDateAndTimeString()
        
        viewModel.toDoItem = viewModel.toDoItem.updateItem(title: title, content: content, date: date)
        
        viewModel.updateData()
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
