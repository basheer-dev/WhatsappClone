//
//  MessageCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 16/07/2023.
//

import UIKit

final class MessageCell: UITableViewCell {
    static let id = "MessageContainer"
    
    private let messageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemGray6
        
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    private let messageContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Hello World"
        label.font = .systemFont(ofSize: 15)
                
        return label
    }()
    
    private let messageTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "23:49"
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var receivedMessageConstraint = messageContentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
    private lazy var sentMessageConstraint = messageContentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
    
    // MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(message: Message) {
        messageContentLabel.text = message.content
        
        if message.wasReceived {
            receivedMessageConstraint.isActive = true
            sentMessageConstraint.isActive = false
            
            messageContainer.backgroundColor = .systemGray6
        } else {
            receivedMessageConstraint.isActive = false
            sentMessageConstraint.isActive = true
            
            messageContainer.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .init(red: 0.125, green: 0.305, blue: 0.274, alpha: 1) : .init(red: 0.9, green: 1, blue: 0.84, alpha: 1)
        }
    }
    
    // MARK: - SUBVIEWS CONFIG
    private func configureSubviews() {
        addSubview(messageContainer)
        addSubview(messageContentLabel)
        addSubview(messageTimeLabel)
        
        NSLayoutConstraint.activate([
            messageContainer.topAnchor.constraint(equalTo: messageContentLabel.topAnchor, constant: -10),
            messageContainer.leadingAnchor.constraint(equalTo: messageContentLabel.leadingAnchor, constant: -15),
            messageContainer.trailingAnchor.constraint(equalTo: messageContentLabel.trailingAnchor, constant: 15),
            messageContainer.bottomAnchor.constraint(equalTo: messageTimeLabel.bottomAnchor, constant: 10),
            
            messageContentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            messageContentLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            messageTimeLabel.topAnchor.constraint(equalTo: messageContentLabel.bottomAnchor, constant: 5),
            messageTimeLabel.trailingAnchor.constraint(equalTo: messageContentLabel.trailingAnchor),
            messageTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ])
    }
}
