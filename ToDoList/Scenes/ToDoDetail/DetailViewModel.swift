//
//  DetailViewModel.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 9.06.2022.
//

import Foundation

final class DetailViewModel {
    private var items = [ToDoItem]()
    private let itemsKey = "todoItem"
    var toDoItem = ToDoItem()
    
    
    init() {
        if let data = UserDefaults.standard.data(forKey: itemsKey) {
            let allItems = try! JSONDecoder().decode([ToDoItem].self, from: data)
            items = allItems
        } else {
            refreshDefaults()
        }
    }
    
    func updateData() {
        if let index = items.firstIndex(where: {$0.id == toDoItem.id}) {
            items[index] = toDoItem
        } else {
            items.append(toDoItem)
        }
        refreshDefaults()
    }
    
    private func refreshDefaults() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: itemsKey)
        } catch {
            print("Failed!")
        }
    }
}
