//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 4.06.2022.
//

import UIKit
import SnapKit

class ToDoListVC: UIViewController {
    private let viewModel = ToDoListViewModel()
    
    private lazy var tableView: UITableView = {
        var table = UITableView()
        table.register(ToDoListCell.self, forCellReuseIdentifier: Constant.ToDoList.cellIdentifier)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 120
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getItemsFromDefaults()
        tableView.reloadData()
    }
    
    private func configure() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Constant.ToDoList.navigationTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDo))
        
        view.addSubview(tableView)
        tableView.pin(to: view)
    }
    
    @objc private func addToDo() {
        let vc = DetailVC()
        vc.setCreateScene()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Conform UITableView delegate methods
extension ToDoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.ToDoList.cellIdentifier, for: indexPath) as! ToDoListCell
        let item = viewModel.items[indexPath.row]
        cell.setCellItem(item: item)
        cell.delegate = self
        return cell
    }
}

// MARK: Conform UITableView delegate methods
extension ToDoListVC: ToDoListCellDelegate {
    func checkButtonTapped(item: ToDoItem) {
        viewModel.updateItemCompletion(item: item)
        tableView.reloadData()
    }
    
    func infoButtonTapped(item: ToDoItem) {
        let vc = DetailVC()
        vc.setEditScene(item: item)
        navigationController?.pushViewController(vc, animated: true)
    }
}

