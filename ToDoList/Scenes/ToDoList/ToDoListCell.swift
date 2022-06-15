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
    
    private var titleLabel = UILabel()
    private var detailLabel = UILabel()
    private var dateLabel = UILabel()
    private var checkButton = UIButton()
    private var infoButton = UIButton()
    
    private var cellItem = ToDoItem()
    
    weak var delegate: ToDoListCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellItem(item: ToDoItem) {
        titleLabel.text = item.title
        dateLabel.text = item.date
        detailLabel.text = item.content
        cellItem = item
    }
    
    private func configure() {
        configureInfoButton()
        configureCheckButton(imageName: cellItem.isCompleted ? "square": "info.circle")
        configureTitle()
        configureDate()
        configureDetail()
        makeAllConstraints()
    }
    
    private func configureInfoButton() {
        contentView.addSubview(infoButton)
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.addTarget(self, action: #selector(infoButtonAction), for: .touchUpInside)
    }
    
    private func configureCheckButton(imageName: String) {
        contentView.addSubview(checkButton)
        checkButton.setImage(UIImage(systemName: imageName), for: .normal)
        checkButton.addTarget(self, action: #selector(checkButtonAction), for: .touchUpInside)
    }
    
    private func configureTitle() {
        self.addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    private func configureDetail() {
        self.addSubview(detailLabel)
        
        detailLabel.font = UIFont.systemFont(ofSize: 16)
        detailLabel.textColor = .lightGray
        detailLabel.numberOfLines = 3
        detailLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
    }
    
    private func configureDate() {
        self.addSubview(dateLabel)
        dateLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    private func makeAllConstraints() {
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
    
    @objc private func infoButtonAction() {
        delegate?.infoButtonTapped(item: cellItem)
    }
    
    @objc private func checkButtonAction() {
        delegate?.checkButtonTapped(item: cellItem)
    }
}
