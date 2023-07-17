//
//  MainTabBarController.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let statusVC = StatusVC()
        let callsVC = CallsVC()
        let communitiesVC = CommunitiesVC()
        let chatsVC = ChatsVC()
        let settingsVC = SettingsVC()
        
        statusVC.tabBarItem = UITabBarItem(title: "Status", image: UIImage(systemName: "circle.dashed"), selectedImage: UIImage(systemName: "circle.dashed.inset.filled"))
        callsVC.tabBarItem = UITabBarItem(title: "Calls", image: UIImage(systemName: "phone"), selectedImage: UIImage(systemName: "phone.fill"))
        communitiesVC.tabBarItem = UITabBarItem(title: "Communities", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))
        chatsVC.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear"))
        
        statusVC.tabBarItem.tag = 0
        callsVC.tabBarItem.tag = 1
        communitiesVC.tabBarItem.tag = 2
        chatsVC.tabBarItem.tag = 3
        settingsVC.tabBarItem.tag = 4
        
        viewControllers = [
            UINavigationController(rootViewController: statusVC),
            UINavigationController(rootViewController: callsVC),
            UINavigationController(rootViewController: communitiesVC),
            UINavigationController(rootViewController: chatsVC),
            UINavigationController(rootViewController: settingsVC)
        ]
        
        selectedIndex = 3
    }
}
