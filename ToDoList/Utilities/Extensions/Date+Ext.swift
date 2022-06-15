//
//  Date+Ext.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 12.06.2022.
//

import Foundation

extension Date {
    func getDateAndTimeString() -> String {
        return DateFormatter.dateAndTime.string(from: self)
    }
}
