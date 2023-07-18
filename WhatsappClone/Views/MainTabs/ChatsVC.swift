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
        
        tableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.id)
        tableView.rowHeight = 76
        tableView.separatorInset.left = 90
        
        return tableView
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
        view.addSubview(tableView)
    }
}


// MARK: SEARCHBAR EXT
extension ChatsVC: UISearchBarDelegate {
    
}


// MARK: - TABLEVIEW EXT
extension ChatsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.id, for: indexPath) as? ChatCell else { fatalError() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let dest = ChatVC()
        navigationItem.backButtonTitle = "10"
        navigationController?.pushViewController(dest, animated: true)
    }
}
