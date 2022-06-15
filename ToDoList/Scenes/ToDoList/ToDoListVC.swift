//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 4.06.2022.
//

import UIKit
import SnapKit

class ToDoListVC: UIViewController {
    let viewModel = ToDoListViewModel()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "To Do List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDo))
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func configure() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ToDoListCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 120
        tableView.pin(to: view)
    }
    
    @objc func addToDo() {
        let vc = DetailViewController()
        vc.setCreateScene()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ToDoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getAllItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoListCell
        let item = viewModel.getAllItems()[indexPath.row]
        cell.setCellItem(item: item)
        cell.delegate = self
        return cell
    }
}

extension ToDoListVC: ToDoListCellDelegate {
    func checkButtonTapped(item: ToDoItem) {
        viewModel.updateItemCompletion(item: item)
        tableView.reloadData()
    }
    
    func infoButtonTapped(item: ToDoItem) {
        let vc = DetailViewController()
        vc.setEditScene(item: item)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

