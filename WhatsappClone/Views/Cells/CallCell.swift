//
//  CallCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 19/07/2023.
//

import UIKit

final class CallCell: UITableViewCell {
    static let id: String = "CallContainer"
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.tintColor = .systemGray
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Basheer Abdulmalik"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private let callStatusImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "phone.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    private let callStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Missed"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "4/18/23"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .plain()
        button.configuration?.cornerStyle = .capsule
        
        button.setImage(UIImage(data: UIImage(systemName: "info.circle")!.withTintColor(.systemBlue).pngData()!, scale: 2.75), for: .normal)
        
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
        contentView.isUserInteractionEnabled = true
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SUBVIEWSCONFIG
    private func configureSubviews() {
        addSubview(userProfileImageView)
        addSubview(userNameLabel)
        addSubview(callStatusImage)
        addSubview(callStatusLabel)
        addSubview(dateLabel)
        addSubview(infoButton)
        addSubview(separator)
        
        NSLayoutConstraint.activate([
            userProfileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            userProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 40),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 40),
            userProfileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            userNameLabel.topAnchor.constraint(equalTo: userProfileImageView.topAnchor, constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 10),
            
            callStatusImage.bottomAnchor.constraint(equalTo: callStatusLabel.bottomAnchor),
            callStatusImage.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            callStatusImage.widthAnchor.constraint(equalToConstant: 15),
            callStatusImage.heightAnchor.constraint(equalToConstant: 15),
            
            callStatusLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            callStatusLabel.leadingAnchor.constraint(equalTo: callStatusImage.trailingAnchor, constant: 3),
            
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -5),
            
            infoButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            infoButton.widthAnchor.constraint(equalToConstant: 30),
            infoButton.heightAnchor.constraint(equalToConstant: 30),
            
            separator.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
