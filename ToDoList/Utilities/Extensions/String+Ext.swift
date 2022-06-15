//
//  String+Ext.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 13.06.2022.
//

import Foundation

extension String {
    func getDateFromString() -> Date? {
        return DateFormatter.dateAndTime.date(from: self)
    }
}
