//
//  DVDatePicker.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 17.06.2022.
//

import UIKit

class DVDatePicker: UIDatePicker {

    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        locale = .current
        datePickerMode = .dateAndTime
        preferredDatePickerStyle = .compact
    }

}
