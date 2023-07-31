//
//  LoginVC.swift
//  loveApp
//
//  Created by Okan Erdinç Arslan on 29.07.2023.
//

import UIKit

class LoginVC: UIViewController {
    var coordinator : Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinator = Coordinator(navigationController: self.navigationController!)
        
        
    }

    @IBAction func logInButtonTapped(_ sender: Any) {
        coordinator?.push(.homeVC)
    }
    
}
