//
//  ChatsSecondSectionCell.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 19/07/2023.
//

import UIKit

final class ChatsSecondSectionCell: UITableViewCell {
    static let id: String = "ChatsSecondSectionContainer"
    
    private let archiveImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "archivebox.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    private let archiveLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Archived"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        return label
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
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SUBVIEWS CONFIG
    private func configureSubviews() {
        addSubview(archiveImageView)
        addSubview(archiveLabel)
        addSubview(separator)
        
        NSLayoutConstraint.activate([
            archiveImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            archiveImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            archiveImageView.widthAnchor.constraint(equalToConstant: 60),
            archiveImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            archiveLabel.leadingAnchor.constraint(equalTo: archiveImageView.trailingAnchor, constant: 5),
            archiveLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            separator.leadingAnchor.constraint(equalTo: archiveLabel.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
