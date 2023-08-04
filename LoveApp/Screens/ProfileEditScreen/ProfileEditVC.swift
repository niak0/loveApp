//
//  ProfileEditVC.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 3.08.2023.
//

import UIKit
enum InfoType: String  {
    case aboutMe = "About me"
    case myInfo = "My info"
    
}
final class ProfileEditVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProfileEditTableCell", bundle: nil), forCellReuseIdentifier: "profileEditCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}
extension ProfileEditVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
        return 5
        case 1:
        return 9
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileEditCell", for: indexPath) as! ProfileEditTableCell
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return InfoType.aboutMe.rawValue
        case 1:
            return InfoType.myInfo.rawValue
        default:
            return ""
        }
    }
    
    
}
