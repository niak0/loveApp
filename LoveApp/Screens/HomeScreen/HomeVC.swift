import UIKit

class HomeVC: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var feedProfileView: UIView!

    // MARK: - Properties
    let dataArray = [
        UserModel(userName: "Okan", userAge: 24, userLocation: "Ankara", userImages: [UIImage(named: "2")!,UIImage(named: "3")!]),
        UserModel(userName: "Nida", userAge: 21, userLocation: "Sivas", userImages: [UIImage(named: "4")!,UIImage(named: "5")!,UIImage(named: "2")!]),
        UserModel(userName: "Zeliş", userAge: 58, userLocation: "Kırıkkale", userImages: [UIImage(named: "6")!,UIImage(named: "7")!,UIImage(named: "2")!,UIImage(named: "3")!]),
    ]
    var coordinator : Coordinator?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfiles()
        coordinator = Coordinator(navigationController: self.navigationController!)
    }
    
    // MARK: - Functions
    func setProfiles() {
        dataArray.forEach { userModel in
            let customView = CustomView(frame: .zero)
            customView.userModel = userModel
            feedProfileView.addSubview(customView)
            customView.fullSuperView()
        }
    }
    
    // MARK: - Actions
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        coordinator?.push(.loginVC)
    }
}

// MARK: - Extensions

