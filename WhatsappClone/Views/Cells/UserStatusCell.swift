//
//  UserStatusCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 18/07/2023.
//

import UIKit

final class UserStatusCell: UITableViewCell {
    static let id = "UserStatusContainer"
    
    private let statusIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .clear
        view.layer.cornerRadius = 34
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.borderWidth = 2
        
        return view
    }()
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 30
        imageView.backgroundColor = .systemGreen
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Basheer Abdulmalik"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "2h ago"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    private let cameraButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .systemGray
        
        button.setImage(UIImage(data: UIImage(systemName: "camera.fill")!.withTintColor(.systemBlue).pngData()!, scale: 4), for: .normal)
        
        return button
    }()
    
    private let textButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .systemGray
        
        button.setImage(UIImage(data: UIImage(systemName: "pencil")!.withTintColor(.systemBlue).pngData()!, scale: 3), for: .normal)
        
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
    
    func set(isContactStatus: Bool = true) {
        
        if isContactStatus {
            cameraButton.isHidden = true
            textButton.isHidden = true
        } else {
            cameraButton.isHidden = false
            textButton.isHidden = false
        }
    }
    
    // MARK: - SUBVIEWS CONFIG
    private func configureSubviews() {
        addSubview(userProfileImageView)
        addSubview(statusIndicator)
        addSubview(userNameLabel)
        addSubview(timeLabel)
        addSubview(cameraButton)
        addSubview(textButton)
        
        NSLayoutConstraint.activate([
            statusIndicator.centerXAnchor.constraint(equalTo: userProfileImageView.centerXAnchor),
            statusIndicator.centerYAnchor.constraint(equalTo: userProfileImageView.centerYAnchor),
            statusIndicator.widthAnchor.constraint(equalToConstant: 68.5),
            statusIndicator.heightAnchor.constraint(equalToConstant: 68.5),
            
            userProfileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            userProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 60),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 60),
            userProfileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            userNameLabel.topAnchor.constraint(equalTo: userProfileImageView.topAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 15),
            
            timeLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            
            cameraButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cameraButton.trailingAnchor.constraint(equalTo: textButton.leadingAnchor, constant: -15),
            cameraButton.widthAnchor.constraint(equalToConstant: 30),
            cameraButton.heightAnchor.constraint(equalToConstant: 30),
            
            textButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            textButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            textButton.widthAnchor.constraint(equalToConstant: 30),
            textButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
