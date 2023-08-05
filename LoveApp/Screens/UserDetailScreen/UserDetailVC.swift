//
//  UserDetailVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 4.08.2023.
//

import UIKit

class UserDetailVC: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var userLocationLbl: UILabel!
    @IBOutlet weak var userGenderLbl: UILabel!
    @IBOutlet weak var userCityLbl: UILabel!
    @IBOutlet weak var userHeightLbl: UILabel!
    @IBOutlet weak var userBiographyLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var verifiedControl: UILabel!
    @IBOutlet weak var photosView: UIView!
    @IBOutlet weak var verifiedLbl: UILabel!
    // MARK: - Properties
    var user : CustomViewModel?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else {return}
        if let user = user.model as? UserModel {
            handleVisibility(for: userCityLbl, with: user.city)
            handleVisibility(for: userNameLbl, with: user.userName)
            handleVisibility(for: userGenderLbl, with: user.userBasicAbout.gender)
            handleVisibility(for: userHeightLbl, with: user.userMoreAbout.height)
            handleVisibility(for: userBiographyLbl, with: user.userBasicAbout.biography)
            handleVisibility(for: verifiedLbl, with: user.verified)
        }
    }
    // MARK: - Functions
    func handleVisibility(for label: UILabel, with value: String) {
        if value.isEmpty {
            label.isHidden = true
        } else {
            label.text = value
            label.isHidden = false
        }
    }
    func setphotosView() {
    }
    // MARK: - Actions
}
// MARK: - Extensions


