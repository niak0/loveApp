//
//  SceneDelegate.swift
//  loveApp
//
//  Created by Okan Erdinç Arslan on 28.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let vc = UINavigationController(rootViewController: LoginVC())
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
    }




}

