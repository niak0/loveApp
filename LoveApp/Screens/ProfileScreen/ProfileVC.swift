//
//  ProfileVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 2.08.2023.
//

import UIKit

class ProfileVC: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var profileIcon: UIImageView!
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBar()
        profileIcon.layer.cornerRadius = profileIcon.frame.size.width / 2
        profileIcon.layer.masksToBounds = true
        profileIcon.clipsToBounds = true

    }
    // MARK: - Functions
    func prepareNavigationBar() {
        let titleView = UILabel()
        titleView.text = "LoveApp"
        navigationItem.titleView = UIView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView:titleView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "shield.fill"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.setRightBarButtonItems([UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(settingsButtonTapped)), UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill.badge.plus"), style: .plain, target: self, action: #selector(editProfileButtonTapped))], animated: true)
     
        
        navigationController?.navigationBar.tintColor = .purple
    
    }
    // MARK: - Actions
    @objc func settingsButtonTapped () {
        let settingsVC = SettingsVC()
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    @objc func editProfileButtonTapped () {
        let settingsVC = ProfileEditVC()
        settingsVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
}
// MARK: - Extensions
