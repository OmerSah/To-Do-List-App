//
//  DateFormatter+Ext.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 7.06.2022.
//

import Foundation

extension DateFormatter
{
    static let dateAndTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        formatter.dateFormat = "yyyy/MM/dd - HH:mm"
        return formatter
    }()
}
