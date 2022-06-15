//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 5.06.2022.
//

import Foundation

final class ToDoListViewModel {
    private var items = [ToDoItem]()

    private let itemsKey = "todoItem"
    
    init() {
        updateItems()
    }
    
    func getAllItems() -> [ToDoItem] {
        updateItems()
        return items
    }
    
    func getSize() -> Int {
        updateItems()
        return items.count
    }
    
    private func updateItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let allItems = try? JSONDecoder().decode([ToDoItem].self, from: data)
        else {
            return
        }
        items = allItems
    }
    
    func updateItemCompletion(item: ToDoItem) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        updateItems()
    }
}
