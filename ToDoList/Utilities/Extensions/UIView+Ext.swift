//
//  File.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 4.06.2022.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    func pin(to view: UIView) {
        self.snp.makeConstraints{ (make) in
            make.edges.equalTo(view)
        }
    }
}
