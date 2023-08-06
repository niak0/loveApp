
import UIKit
enum Screen {
    case signInVC
    case signUpVC
    case filterVC
    case userDetailVC(customViewModel : CustomViewModel?)
    case chatVC
    case profileEditVc
    case editingProfileVC
    case settingsVC
    case safetyVC
}
class Coordinator {
       private var homeNC: UINavigationController
       private var chatsNC: UINavigationController
       private var profileNC: UINavigationController
        
     init(homeNC: UINavigationController, chatsNC: UINavigationController, profileNC: UINavigationController) {
            self.homeNC = homeNC
            self.chatsNC = chatsNC
            self.profileNC = profileNC
        }
    private func viewController(for screen: Screen) -> UIViewController {
            switch screen {
            case .signInVC:
                return SignInVC()
            case .signUpVC:
                return SignUpVC()
            case .filterVC:
                return FilterVC()
            case .userDetailVC(customViewModel: let customViewModel):
                let userDetailVC = UserDetailVC()
                userDetailVC.user = customViewModel
                return userDetailVC
            case .chatVC:
                return ChatVC()
            case .profileEditVc:
                return ProfileEditVC()
            case .editingProfileVC:
                return EditingProfileVC()
            case .settingsVC:
                return SettingsVC()
            case .safetyVC:
                return SafetyVC()
            }
        }
    
    func push(_ screen: Screen, from navigationController: UINavigationController) {
        let viewController = viewController(for: screen)
        navigationController.pushViewController(viewController, animated: true)
    }
    func present(to screen: Screen, modalyType: UIModalPresentationStyle, from navigationController: UINavigationController) {
        let viewController = viewController(for: screen)
        viewController.modalPresentationStyle = modalyType
        navigationController.present(viewController, animated: true)
    }
    func setTabbar(from viewController : UIViewController) {
        let tabbar = TabbarController()
        let sceneDelegate = viewController.view.window?.windowScene?.delegate as! SceneDelegate
            sceneDelegate.window?.rootViewController = tabbar
    }
    func pop(from navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}


