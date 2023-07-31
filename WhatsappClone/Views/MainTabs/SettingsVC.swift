//
//  SettingsVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class SettingsVC: UIViewController {
    private var content: [[[String: String]]] = [
        [
            ["title": "Starred Messages", "image": "StarredMessages"],
            ["title": "Linked Devices", "image": "LinkedDevices"]
        ],
        [
            ["title": "Account", "image": "Account"],
            ["title": "Privacy", "image": "Privacy"],
            ["title": "Chats", "image": "Chats"],
            ["title": "Notifications", "image": "Notifications"],
            ["title": "Storage and Data", "image": "StorageAndData"]
        ],
        [
            ["title": "Help", "image": "Help"],
            ["title": "Tell a Friend", "image": "TellAFriend"]
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.id)
        
        tableView.backgroundColor = .secondarySystemBackground
        tableView.layoutMargins = .zero
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
        return section == 0 ? 1 : content[section - 1].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.id, for: indexPath) as? SettingsCell else { fatalError() }
            cell.separatorInset = .zero
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        var cellInfo = cell.defaultContentConfiguration()
        
        let section = indexPath.section - 1
        let row = indexPath.row
        
        cellInfo.text = content[section][row]["title"]
        cellInfo.image = UIImage(named: content[section][row]["image"]!)
        cellInfo.imageProperties.maximumSize = CGSize(width: 23, height: 23)
        cellInfo.imageProperties.cornerRadius = 5
        
        cell.contentConfiguration = cellInfo
        cell.accessoryType = .disclosureIndicator
        
        if indexPath.row == content[section].count - 1 {
            cell.separatorInset = .zero
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
