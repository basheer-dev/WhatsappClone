//
//  ChatsFirstSectionCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 19/07/2023.
//

import UIKit

final class ChatsFirstSectionCell: UITableViewCell {
    static let id: String = "ChatsFirstSectionContainer"
    
    private let broadcastButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .plain()
        button.configuration?.title = "Broadcast List"
        
        return button
    }()
    
    private let newGroupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .plain()
        button.configuration?.title = "New Group"
        
        return button
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    // MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SUBVIEWS CONFIG
    private func configureSubviews() {
        addSubview(broadcastButton)
        addSubview(newGroupButton)
        addSubview(separator)
        
        NSLayoutConstraint.activate([
            broadcastButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            broadcastButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            broadcastButton.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            broadcastButton.heightAnchor.constraint(equalToConstant: 30),
            broadcastButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            newGroupButton.topAnchor.constraint(equalTo: broadcastButton.topAnchor),
            newGroupButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            newGroupButton.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            newGroupButton.heightAnchor.constraint(equalToConstant: 30),
            
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
