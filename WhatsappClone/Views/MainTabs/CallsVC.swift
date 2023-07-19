//
//  CallsVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class CallsVC: UIViewController {
    private var content: [[[String: String]]] = [
        [],
        [
            [
                "user": "BasheerAbdulmalik",
                "callStatus": "Missed",
                "date": "18/4/23"
            ],
            [
                "user": "BasheerAbdulmalik",
                "callStatus": "Outgoing",
                "date": "18/4/23"
            ],
            [
                "user": "BasheerAbdulmalik",
                "callStatus": "Missed",
                "date": "18/4/23"
            ],
            [
                "user": "BasheerAbdulmalik",
                "callStatus": "Incoming",
                "date": "18/4/23"
            ],
            [
                "user": "BasheerAbdulmalik",
                "callStatus": "Missed",
                "date": "18/4/23"
            ],
            [
                "user": "BasheerAbdulmalik",
                "callStatus": "Outgoing",
                "date": "18/4/23"
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
        
        tableView.register(CreateCallLinkCell.self, forCellReuseIdentifier: CreateCallLinkCell.id)
        tableView.register(CallCell.self, forCellReuseIdentifier: CallCell.id)
        
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
        
        label.text = "Your personal calls are "
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "phone.arrow.up.right"), style: .plain, target: self, action: nil)
        
        title = "Calls"
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
extension CallsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? nil : "Recent\n "
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header: UITableViewHeaderFooterView = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        header.textLabel?.textColor = .label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content[section].isEmpty ? 1 : content[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateCallLinkCell.id, for: indexPath) as? CreateCallLinkCell else { fatalError() }
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CallCell.id, for: indexPath) as? CallCell else { fatalError() }
        
        if indexPath.row == content[1].count - 1 {
            cell.separator.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
