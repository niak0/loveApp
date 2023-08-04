//
//  MainCoordinator.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 2.08.2023.
//

import UIKit

class AppCoordinator {
    
        var homeNC: UINavigationController
        var chatsNC: UINavigationController
        var profileNC: UINavigationController
        
        init(homeNC: UINavigationController, chatsNC: UINavigationController, profileNC: UINavigationController) {
            self.homeNC = homeNC
            self.chatsNC = chatsNC
            self.profileNC = profileNC
        }
        
        func navigateToDetail(from vc: UIViewController) {
            // navigate to detail view controller
        }
        
        // ... Diğer navigasyon işlemleri
}


