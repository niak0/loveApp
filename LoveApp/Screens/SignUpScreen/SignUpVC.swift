//
//  SignUpVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 1.08.2023.
//

import UIKit

class SignUpVC: UIViewController {
    var coordinator: Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = Coordinator(navigationController: self.navigationController!)

    }

    @IBAction func logInButtonTapped(_ sender: UIButton) {
        coordinator?.pop()
    }
    

}
