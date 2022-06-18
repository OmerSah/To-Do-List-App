//
//  DVTextField.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 17.06.2022.
//

import UIKit

class DVTextField: UITextField {

    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String){
        super.init(frame: .zero)
        self.placeholder = placeholder
        configure()
    }
    
    private func configure(){
        font = UIFont.systemFont(ofSize: 20)
        borderStyle = .roundedRect
    }

}
