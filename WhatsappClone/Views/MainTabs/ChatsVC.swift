//
//  ChatsVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class ChatsVC: UIViewController {
    
    lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.delegate = self
        
        return controller
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ChatsFirstSectionCell.self, forCellReuseIdentifier: ChatsFirstSectionCell.id)
        tableView.register(ChatsSecondSectionCell.self, forCellReuseIdentifier: ChatsSecondSectionCell.id)
        tableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.id)
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private let lockImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "lock.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    private let footerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Your personal messages are "
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    private let footerLinkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "end-to-end encrypted"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Chats"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil),
            UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil)
        ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
        tableView.tableFooterView = createTableViewFooter()
        
        view.addSubview(tableView)
    }
    
    private func createTableViewFooter() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lockImageView)
        view.addSubview(footerLabel)
        view.addSubview(footerLinkLabel)
        
        NSLayoutConstraint.activate([
            lockImageView.topAnchor.constraint(equalTo: view.topAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lockImageView.widthAnchor.constraint(equalToConstant: 15),
            lockImageView.heightAnchor.constraint(equalToConstant: 15),
            lockImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            footerLabel.leadingAnchor.constraint(equalTo: lockImageView.trailingAnchor, constant: 5),
            footerLabel.centerYAnchor.constraint(equalTo: lockImageView.centerYAnchor),
            
            footerLinkLabel.leadingAnchor.constraint(equalTo: footerLabel.trailingAnchor),
            footerLinkLabel.centerYAnchor.constraint(equalTo: footerLabel.centerYAnchor),
            footerLinkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60)
        
        footerView.addSubview(view)
        view.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 5).isActive = true
        
        return footerView
    }
}


// MARK: - SEARCHBAR EXT
extension ChatsVC: UISearchBarDelegate {
    
}


// MARK: - TABLEVIEW EXT
extension ChatsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 2 ? 10 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatsFirstSectionCell.id, for: indexPath) as? ChatsFirstSectionCell else { fatalError() }
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatsSecondSectionCell.id, for: indexPath) as? ChatsSecondSectionCell else { fatalError() }
            
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.id, for: indexPath) as? ChatCell else { fatalError() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section > 1 {
            
            let dest = ChatVC()
            navigationItem.backButtonTitle = "10"
            navigationController?.pushViewController(dest, animated: true)
        }
    }
}
