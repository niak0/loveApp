//
//  UserDetailVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 4.08.2023.
//

import UIKit

class UserDetailVC: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var userLocationLbl: UILabel!
    @IBOutlet weak var userGenderLbl: UILabel!
    @IBOutlet weak var userCityLbl: UILabel!
    @IBOutlet weak var userHeightLbl: UILabel!
    @IBOutlet weak var userBiographyLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var verifiedControl: UILabel!
    @IBOutlet weak var verifiedLbl: UILabel!
    // MARK: - Properties
    var user : CustomViewModel?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
        
        self.tabBarController?.tabBar.isHidden = true
        
        guard let user = user else {return}
        if let user = user.model as? UserModel {
            userNameLbl.text = "\(user.userName), \(user.userAge)"
            handleVisibility(for: userCityLbl, with: user.city)
            handleVisibility(for: userGenderLbl, with: user.userBasicAbout.gender)
            handleVisibility(for: userHeightLbl, with: user.userMoreAbout.height)
            handleVisibility(for: userBiographyLbl, with: user.userBasicAbout.biography)
            handleVisibility(for: verifiedLbl, with: user.verified)
        }
    }
    // MARK: - Functions
    func prepareCollectionView () {
        self.photosCollectionView.register(UINib(nibName: "UserDetailCollectionCell", bundle: nil), forCellWithReuseIdentifier: "userDetailCell")
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
    }
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
extension UserDetailVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (user?.photos.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userDetailCell", for: indexPath) as! UserDetailCollectionCell
        cell.photos.image = user?.photos[indexPath.row].withRenderingMode(.alwaysOriginal)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height) // her bir hücre superviewin boyutunda olucak
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

