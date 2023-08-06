import UIKit

class HomeVC: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var feedProfileView: UIView!
    // MARK: - Properties
    var coordinator : Coordinator?
    let dataArray = [
        UserModel(userName: "Okan", userAge: 24, userLocation: "16", city: "Ankara", userImages: [UIImage(named: "6")!,UIImage(named: "7")!,UIImage(named: "2")!,UIImage(named: "3")!], verified: "Verified", userBasicAbout: UserBasicAboutModel(biography: "buluşmak isteyen varsa yazsın", lookingFor: "Manita", work: "IOS Developer", education: "Hacettepe University", gender: "Male"), userMoreAbout: UserMoreAboutModel(height: "185", exercise: "Somethimes", drinking: "Also", smoking: "Yes", sleepingHabbits: "Night Owl", dietaryPreference: "Vegan", religion: "Terorist", politics: "AKP", starSign: "Moon")).turnCustomViewModel(),
        UserModel(userName: "Merve", userAge: 20, userLocation: "31", city: "Balıkesir", userImages: [UIImage(named: "6")!,UIImage(named: "4")!,UIImage(named: "5")!,UIImage(named: "3")!], verified: "Not verified", userBasicAbout: UserBasicAboutModel(biography: "Selam ben ankaradan okan beni arayın", lookingFor: "Manita", work: "IOS Developer", education: "Hacettepe University", gender: "Female"), userMoreAbout: UserMoreAboutModel(height: "185", exercise: "Somethimes", drinking: "Also", smoking: "Yes", sleepingHabbits: "Night Owl", dietaryPreference: "Vegan", religion: "Terorist", politics: "AKP", starSign: "Moon")).turnCustomViewModel(),
        AdsModel(adTitle: "Apple", adSubtitle: "Download Now!", adImages: [UIImage(named: "6")!]).turnCustomViewModel()
    ]
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfiles()
        prepareNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    func prepareNavigationBar() {
        let titleView = UILabel()
        titleView.text = "LoveApp"
        navigationItem.titleView = UIView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView:titleView)
        navigationItem.setRightBarButtonItems([UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(filterButtonTapped)), UIBarButtonItem(image: UIImage(systemName: "bolt.ring.closed"), style: .plain, target: self, action: #selector(boostButtonTapped))], animated: true)
        navigationController?.navigationBar.tintColor = .purple
        navigationItem.backButtonTitle = "Eşleş"
    }
    func setProfiles() {
        dataArray.forEach { userModel in
            let customView = CustomView(frame: .zero)
            customView.userModel = userModel
            feedProfileView.addSubview(customView)
            customView.fullSuperView()
            customView.customViewDelegate = self
        }
    }
    
    // MARK: - IBActions
 
    // MARK: - Objc Funcs
    @objc func boostButtonTapped() {
        
    }
    @objc func filterButtonTapped() {
        coordinator?.push(.filterVC, from: self.navigationController!)
    }
}

// MARK: - Extensions
extension HomeVC : CustomViewDelegate {
    func didSendUserModel(_ userModel: CustomViewModel) {
        coordinator?.push(.userDetailVC(customViewModel: userModel), from: self.navigationController!)
    }
}
