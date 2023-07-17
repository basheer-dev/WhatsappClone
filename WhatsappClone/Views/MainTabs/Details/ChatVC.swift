//
//  ChatVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 16/07/2023.
//

import UIKit

final class ChatVC: UIViewController {
    private var messages: [Message] = [
        Message(content: "hello basheer", wasReceived: true),
        Message(content: "oh hello there", wasReceived: false)
    ]
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .systemGray
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Basheer Abdulmalik"
                
        return label
    }()
    
    private lazy var userInfoContainer: UIView = {
        let view = UIView()
        
        view.addSubview(userProfileImageView)
        view.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            userProfileImageView.topAnchor.constraint(equalTo: view.topAnchor),
            userProfileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userProfileImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 40),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 5),
            userNameLabel.centerYAnchor.constraint(equalTo: userProfileImageView.centerYAnchor)
        ])
        
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.contentInset.top = 50
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.id)
        
        return tableView
    }()
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "phone"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "video"), style: .done, target: self, action: nil)
        ]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userInfoContainer)
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}


// MARK: - TABLEVIEW EXT
extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.id, for: indexPath) as? MessageCell else { fatalError() }
        cell.set(message: messages[indexPath.row])
        
        return cell
    }
}
