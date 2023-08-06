import UIKit
final class ProfileEditVC: UIViewController {
    // MARK: - UI Elements
    
    // MARK: - Properties
    var aboutMeArray : [ProfileEditModel] = [
        ProfileEditModel(title: AboutMe.work.rawValue, icon: UIImage(systemName: "person.crop.rectangle")!),
        ProfileEditModel(title: AboutMe.education.rawValue, icon: UIImage(systemName: "pencil.circle")!),
        ProfileEditModel(title: AboutMe.gender.rawValue, icon: UIImage(systemName: "figure.dress.line.vertical.figure")!),
        ProfileEditModel(title: AboutMe.city.rawValue, icon: UIImage(systemName: "house.circle")!)
    ]
    var myInfoArray : [ProfileEditModel] = [
        ProfileEditModel(title: MyInfo.lookingFor.rawValue, icon: UIImage(systemName: "pencil.circle")!),
        ProfileEditModel(title: MyInfo.height.rawValue, icon: UIImage(systemName: "figure.dress.line.vertical.figure")!),
        ProfileEditModel(title: MyInfo.exercise.rawValue, icon: UIImage(systemName: "house.circle")!),
        ProfileEditModel(title: MyInfo.drinking.rawValue, icon: UIImage(systemName: "person.crop.rectangle")!),
        ProfileEditModel(title: MyInfo.smoking.rawValue, icon: UIImage(systemName: "house.circle")!),
        ProfileEditModel(title: MyInfo.sleepingHabbits.rawValue, icon: UIImage(systemName: "pencil.circle")!),
        ProfileEditModel(title: MyInfo.dietaryPreference.rawValue, icon: UIImage(systemName: "figure.dress.line.vertical.figure")!),
        ProfileEditModel(title: MyInfo.religion.rawValue, icon: UIImage(systemName: "house.circle")!),
        ProfileEditModel(title: MyInfo.politics.rawValue, icon: UIImage(systemName: "figure.dress.line.vertical.figure")!),
        ProfileEditModel(title: MyInfo.starSign.rawValue, icon: UIImage(systemName: "house.circle")!)
    ]
    // MARK: - Life Cycle
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        self.tabBarController?.tabBar.isHidden = true
    }
    // MARK: - Functions
    func prepareTableView() {
        tableView.register(UINib(nibName: "ProfileEditTableCell", bundle: nil), forCellReuseIdentifier: "profileEditCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - Actions
    
}
// MARK: - Extensions
extension ProfileEditVC : UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileEditCell", for: indexPath) as! ProfileEditTableCell
        
        switch indexPath.section {
        case 0:
            cell.infoIcon.image = aboutMeArray[indexPath.row].icon
            cell.infoName.text = aboutMeArray[indexPath.row].title
            cell.infoResult.text = "no value"
        case 1:
            cell.infoIcon.image = myInfoArray[indexPath.row].icon
            cell.infoName.text = myInfoArray[indexPath.row].title
            cell.infoResult.text = "no value"
        default:
            break
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EditingProfileVC()
        self.navigationController?.pushViewController(vc, animated: true)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return AboutMe.allCases.count
        case 1:
            return MyInfo.allCases.count - 1 // - 1 sebebi biography'de bu enumda
        default:
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        let label = UILabel()
        if section == 0 {
            label.text = InfoType.aboutMe.rawValue
        } else {
            label.text = InfoType.myInfo.rawValue
        }
        
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
 
        NSLayoutConstraint.activate([
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 1)])
        return headerView
    }
    
}
