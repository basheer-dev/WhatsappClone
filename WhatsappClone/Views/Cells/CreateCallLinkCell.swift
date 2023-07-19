//
//  CreateCallLinkCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 19/07/2023.
//

import UIKit

final class CreateCallLinkCell: UITableViewCell {
    static let id: String = "CreateCallLinkContainer"
    
    private let linkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .systemGray
        
        button.setImage(UIImage(data: UIImage(systemName: "link")!.withTintColor(.systemBlue).pngData()!, scale: 3.5), for: .normal)
        
        return button
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Create Call Link"
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemBlue
        
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Share a link for your WhatsAppClone call"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    // MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SUBVIEWS CONFIG
    private func configureSubviews(){
        addSubview(linkButton)
        addSubview(title)
        addSubview(subTitle)
        addSubview(separator)
        
        NSLayoutConstraint.activate([
            linkButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            linkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            linkButton.widthAnchor.constraint(equalToConstant: 40),
            linkButton.heightAnchor.constraint(equalToConstant: 40),
            linkButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            title.topAnchor.constraint(equalTo: linkButton.topAnchor, constant: 3),
            title.leadingAnchor.constraint(equalTo: linkButton.trailingAnchor, constant: 15),
            
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 3),
            subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
