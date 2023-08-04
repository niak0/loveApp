//
//  LoginVC.swift
//  loveApp
//
//  Created by Okan Erdinç Arslan on 29.07.2023.
//

import UIKit

class SignInVC: UIViewController {
    // MARK: - UI Elements
    
    // MARK: - Properties
    var coordinator : Coordinator?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = Coordinator(navigationController: self.navigationController!)
        
        
    }
    // MARK: - Functions
    
    // MARK: - Actions
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        coordinator?.push(.signUpVC)
    }
    @IBAction func logInButtonTapped(_ sender: Any) {
        coordinator?.setTabbar(from: self)
    }
    
}
    // MARK: - Extensions
    

    

    


