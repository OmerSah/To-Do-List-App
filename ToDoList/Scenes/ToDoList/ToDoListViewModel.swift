//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 5.06.2022.
//

import Foundation

final class ToDoListViewModel {
    private(set) var items = [ToDoItem]()

    private let itemsKey = Constant.UserDefaultsConstants.itemsKey
    
    init() {
        getItemsFromDefaults()
    }
    
    func updateItemCompletion(item: ToDoItem) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        addItemsToDefaults()
    }
    
    func getItemsFromDefaults() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let allItems = try? JSONDecoder().decode([ToDoItem].self, from: data) else { return }
        items = allItems
    }
    
    private func addItemsToDefaults() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: itemsKey)
    }
}
