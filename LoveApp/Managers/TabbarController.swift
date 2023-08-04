//
//  TabbarController.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 2.08.2023.
//

import UIKit

class TabbarController: UITabBarController {
    var coordinator : AppCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let chatsVC = MessageVC()
        chatsVC.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "message"), tag: 1)
        
        let profileVC = ProfileVC()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 2)
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let chatsNC = UINavigationController(rootViewController: chatsVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        
        self.viewControllers = [homeNC,chatsNC,profileNC]
        self.tabBar.backgroundColor = .black
        self.tabBar.tintColor = .purple
        
        coordinator = AppCoordinator(homeNC: homeNC, chatsNC: chatsNC, profileNC: profileNC)
        
        
    }
    

}
