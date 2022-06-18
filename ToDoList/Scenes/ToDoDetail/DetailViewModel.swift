//
//  DetailViewModel.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 9.06.2022.
//

import Foundation

final class DetailViewModel {
    private var items = [ToDoItem]()
    private let itemsKey = Constant.UserDefaultsConstants.itemsKey
    
    var toDoItem = ToDoItem()
    
    init() {
        getItemsFromDefaults()
    }
    
    func updateData() {
        if let index = items.firstIndex(where: {$0.id == toDoItem.id}) {
            items[index] = toDoItem
        } else {
            items.append(toDoItem)
        }
        addItemsToDefaults()
    }
    
    private func getItemsFromDefaults() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let allItems = try? JSONDecoder().decode([ToDoItem].self, from: data) else { return }
        items = allItems
    }
    
    private func addItemsToDefaults() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: itemsKey)
    }
}
