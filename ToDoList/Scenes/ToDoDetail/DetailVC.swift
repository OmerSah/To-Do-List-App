//
//  ViewController.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 9.06.2022.
//

import UIKit
import SnapKit

class DetailVC: UIViewController {
    private let titleDescriptionLabel = DVDescriptionLabel(title: Constant.DetailView.titleLabel)
    private let contentDescriptionLabel = DVDescriptionLabel(title: Constant.DetailView.contentLabel)
    private let dateDescriptionLabel = DVDescriptionLabel(title: Constant.DetailView.dateLabel)

    private let titleTextField = DVTextField(placeholder: Constant.DetailView.titleField)
    private let contentTextField = DVTextField(placeholder: Constant.DetailView.contentField)
    
    private let datePicker = DVDatePicker()
    
    private let viewModel = DetailViewModel()
    
    private var operation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    private func configure() {
        view.backgroundColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: operation, style: .plain, target: self, action: #selector(toDoAction))
        
        addSubviews()
        makeAllConstraints()
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

// MARK: Configure DetailVC scene
extension DetailVC {
    func setEditScene(item: ToDoItem) {
        navigationItem.title = Constant.DetailView.editSceneTitle
        operation = Constant.DetailView.editSceneOperation
        
        viewModel.toDoItem = item
            
        titleTextField.text = item.title
        contentTextField.text = item.content
        datePicker.date = item.date.getDateAndTime() ?? Date()
    }
    
    func setCreateScene() {
        navigationItem.title = Constant.DetailView.createSceneTitle
        operation = Constant.DetailView.creteSceneOperation
    }
}

// MARK: Make constraints and add subviews
private extension DetailVC {
    func addSubviews() {
        view.addSubview(datePicker)
        view.addSubview(titleTextField)
        view.addSubview(contentTextField)
        view.addSubview(titleDescriptionLabel)
        view.addSubview(contentDescriptionLabel)
        view.addSubview(dateDescriptionLabel)
    }
    
    func makeAllConstraints() {
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
}
