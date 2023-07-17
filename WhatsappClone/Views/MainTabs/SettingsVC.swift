//
//  SettingsVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

class SettingsVC: UIViewController {
    private var content: [[[String: Any]]] = [
        [
            [:]
        ],
        [
            ["title": "Starred Messages", "image": "star.square.fill", "tintColor": UIColor.systemYellow],
            ["title": "Linked Devices", "image": "laptopcomputer.and.ipad", "tintColor": UIColor.systemMint]
        ],
        [
            ["title": "Account", "image": "key.fill", "tintColor": UIColor.systemBlue],
            ["title": "Privacy", "image": "lock.square.fill", "tintColor": UIColor.systemMint],
            ["title": "Chats", "image": "message.circle.fill", "tintColor": UIColor.systemGreen],
            ["title": "Notifications", "image": "bell.square.fill", "tintColor": UIColor.systemRed],
            ["title": "Storage and Data", "image": "memorychip.fill", "tintColor": UIColor.systemGreen]
        ],
        [
            ["title": "Help", "image": "info.square.fill", "tintColor": UIColor.link],
            ["title": "Tell a Friend", "image": "heart.square.fill", "tintColor": UIColor.systemPink]
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
        
        tableView.backgroundColor = .secondarySystemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.id)
        tableView.contentInset.bottom = 100
        
        return tableView
    }()
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Settings"
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}


// MARK: - TABLEVIEW EXT
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? nil : " "
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.id, for: indexPath) as? SettingsCell else { fatalError() }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        var cellInfo = cell.defaultContentConfiguration()
        
        let section = indexPath.section
        let row = indexPath.row
        
        cellInfo.text = content[section][row]["title"] as? String
        cellInfo.image = UIImage(systemName: content[section][row]["image"] as! String)
        cellInfo.imageProperties.tintColor = content[section][row]["tintColor"] as? UIColor
        
        cell.contentConfiguration = cellInfo
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
