//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 7.06.2022.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    let id: String
    let title: String
    let content: String
    let date: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString,title: String = "", content: String = "", date: String = "", isCompleted: Bool = true) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.isCompleted = true
    }
    
    func updateItem(title: String, content: String, date: String) -> ToDoItem {
        return ToDoItem(id: self.id, title: title, content: content, date: date)
    }
    
    func updateCompletion() -> ToDoItem {
        return ToDoItem(id: self.id, title: title, content: content, date: date, isCompleted: !isCompleted)
    }
}
    

