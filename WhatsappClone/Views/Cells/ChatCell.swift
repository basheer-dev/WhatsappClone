//
//  ChatCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 16/07/2023.
//

import UIKit

final class ChatCell: UITableViewCell {
    static let id = "ChatContainer"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .systemGray
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Basheer Abdulmalik"
                
        return label
    }()
    
    private let dateTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "12/4/23"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        
        return label
    }()
    
    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "you should visit this website https://github.com/basheer-dev/MarvelVerse"
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .systemGray
        
        return label
    }()
    
    private let newMessagesContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .link
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private let newMessagesCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "\(Int.random(in: 1...100))"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemBackground
        
        return label
    }()
    
    // MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SUBVIEWS
    private func configureSubviews() {
        addSubview(profileImageView)
        addSubview(userNameLabel)
        addSubview(dateTimeLabel)
        addSubview(lastMessageLabel)
        addSubview(newMessagesContainer)
        addSubview(newMessagesCountLabel)
                
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
//            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: dateTimeLabel.leadingAnchor, constant: -10),
            
            dateTimeLabel.topAnchor.constraint(equalTo: userNameLabel.topAnchor),
            dateTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            lastMessageLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 2),
            lastMessageLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            lastMessageLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            
            newMessagesContainer.topAnchor.constraint(equalTo: lastMessageLabel.topAnchor),
            newMessagesContainer.trailingAnchor.constraint(equalTo: dateTimeLabel.trailingAnchor),
            newMessagesContainer.heightAnchor.constraint(equalToConstant: 20),
            newMessagesContainer.widthAnchor.constraint(equalToConstant: newMessagesCountLabel.intrinsicContentSize.width + 14.33),
            
            newMessagesCountLabel.centerXAnchor.constraint(equalTo: newMessagesContainer.centerXAnchor),
            newMessagesCountLabel.centerYAnchor.constraint(equalTo: newMessagesContainer.centerYAnchor)
        ])
    }
}
