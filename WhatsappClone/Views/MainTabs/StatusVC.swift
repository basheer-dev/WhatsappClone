//
//  StatusVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class StatusVC: UIViewController {
    private var statusCollection: [[String: Any]] = [
        [
            "title": " ",
            "users": [
                "My Status"
            ]
        ],
        [
            "title": "RECENT UPDATES",
            "users": [
                "Basheer Abdulmalik",
                "Basheer Abdulmalik"
            ]
        ],
        [
            "title": "VIEWED UPDATES",
            "users": [
                "Basheer Abdulmalik",
                "Basheer Abdulmalik",
                "Basheer Abdulmalik",
                "Basheer Abdulmalik",
                "Basheer Abdulmalik",
                "Basheer Abdulmalik"
            ]
        ]
    ]
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        
        return controller
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserStatusCell.self, forCellReuseIdentifier: UserStatusCell.id)
        
        tableView.backgroundColor = .secondarySystemBackground
        
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
        
        label.text = "Your status updates are "
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Privacy", style: .plain, target: self, action: nil)
        
        title = "Status"
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


// MARK: - TABLEVIEW EXT
extension StatusVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return statusCollection[section]["title"] as? String
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = .systemFont(ofSize: 12)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return statusCollection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let users = statusCollection[section]["users"] as? [String] else { return 0 }
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserStatusCell.id, for: indexPath) as? UserStatusCell else { fatalError() }
        
        if indexPath.section == 0 {
            cell.set(isContactStatus: false)
        } else {
            cell.set()
        }
        
        if indexPath.row >= 1 {
            tableView.separatorInset.left = 90
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
