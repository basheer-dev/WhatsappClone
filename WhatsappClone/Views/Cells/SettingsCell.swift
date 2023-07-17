//
//  SettingsCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 17/07/2023.
//

import UIKit

final class SettingsCell: UITableViewCell {
    static let id = "SettingsHeaderContainer"
    
    private let userProfileImageView: UIImageView = {
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
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "عوضني يا رب بأيام لا تسرق من عمري."
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private let QRCodeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.image = UIImage(systemName: "qrcode")
        button.configuration?.baseBackgroundColor = .systemGray
        
        button.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        
        return button
    }()
    
    // MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SUBVIEWS
    private func configureSubviews() {
        addSubview(userProfileImageView)
        addSubview(userNameLabel)
        addSubview(statusLabel)
        addSubview(QRCodeButton)
        
        NSLayoutConstraint.activate([
            userProfileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            userProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 60),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 60),
            userProfileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            
            userNameLabel.topAnchor.constraint(equalTo: userProfileImageView.topAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: QRCodeButton.leadingAnchor, constant: -10),
            
            statusLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            statusLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            
            QRCodeButton.centerYAnchor.constraint(equalTo: userProfileImageView.centerYAnchor),
            QRCodeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
