//
//  DescriptionLabel.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 17.06.2022.
//

import UIKit

class DVDescriptionLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String){
        super.init(frame: .zero)
        text = title
        configure()
    }
    
    private func configure(){
        font = UIFont.boldSystemFont(ofSize: 12)
        textColor = .lightGray
    }
}
