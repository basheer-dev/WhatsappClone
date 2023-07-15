//
//  ChatsVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

class ChatsVC: UIViewController {
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Chats"
    }
}