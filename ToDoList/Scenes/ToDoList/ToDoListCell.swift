//
//  ToDoListCell.swift
//  ToDoList
//
//  Created by Ömer Faruk Şahin on 5.06.2022.
//

import UIKit
import SnapKit

protocol ToDoListCellDelegate: AnyObject {
    func infoButtonTapped(item: ToDoItem)
    func checkButtonTapped(item: ToDoItem)
}

class ToDoListCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 24)
        return title
    }()
    private let detailLabel: UILabel = {
        let detail = UILabel()
        detail.font = UIFont.systemFont(ofSize: 16)
        detail.textColor = .lightGray
        detail.numberOfLines = 2
        detail.lineBreakMode = NSLineBreakMode.byTruncatingTail
        return detail
    }()
    private let dateLabel: UILabel = {
        let date = UILabel()
        date.font = UIFont.systemFont(ofSize: 12)
        return date
    }()
    
    private let checkButton: UIButton = {
        let check = UIButton()
        check.setImage(UIImage(systemName: Constant.ToDoListCell.incompleteImage), for: .normal)
        check.setImage(UIImage(systemName: Constant.ToDoListCell.completeImage), for: .selected)
        check.addTarget(self, action: #selector(checkButtonAction), for: .touchUpInside)
        return check
    }()
    private let infoButton: UIButton = {
        let info = UIButton()
        info.setImage(UIImage(systemName: Constant.ToDoListCell.infoImage), for: .normal)
        info.addTarget(self, action: #selector(infoButtonAction), for: .touchUpInside)
        return info
    }()
    
    weak var delegate: ToDoListCellDelegate?
    
    private var cellItem = ToDoItem()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews()
        makeAllConstraints()
    }
    
    func setCellItem(item: ToDoItem) {
        titleLabel.text = item.title
        dateLabel.text = item.date
        detailLabel.text = item.content
        cellItem = item
        checkButton.isSelected = item.isCompleted
    }

    @objc private func infoButtonAction() {
        delegate?.infoButtonTapped(item: cellItem)
    }
    
    @objc private func checkButtonAction() {
        delegate?.checkButtonTapped(item: cellItem)
    }
}

// MARK: Make constraints and add subviews
private extension ToDoListCell {
    private func addSubviews() {
        contentView.addSubview(infoButton)
        contentView.addSubview(checkButton)
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(dateLabel)
    }
    
    func makeAllConstraints() {
        titleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(18)
            make.leading.equalTo(56)
        }
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(56)
            make.trailing.equalTo(-32)
        }
        detailLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.leading.equalTo(64)
            make.trailing.equalTo(-16)
        }
        checkButton.snp.makeConstraints {
            $0.leading.equalTo(16)
            $0.top.equalTo(20)
        }
        checkButton.imageView?.snp.makeConstraints {
            $0.size.equalTo(24)
        }
        infoButton.snp.makeConstraints {
            $0.trailing.equalTo(-24)
            $0.top.equalTo(20)
        }
        infoButton.imageView?.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
}
