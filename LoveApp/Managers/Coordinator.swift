import UIKit

class Coordinator {
    enum Screen {
        case signInVC
        case signUpVC
    }
    
    let navigationController : UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func viewController(for screen: Screen) -> UIViewController {
            switch screen {
            case .signInVC:
                return SignInVC()
            case .signUpVC:
                return SignUpVC()
            }
        }
    
    func push(_ screen: Screen) {
        let viewController = viewController(for: screen)
        navigationController.pushViewController(viewController, animated: true)
    }
    func present(_ screen: Screen, modalyType: UIModalPresentationStyle ) {
        let viewController = viewController(for: screen)
        viewController.modalPresentationStyle = modalyType
        navigationController.present(viewController, animated: true)
    }
    func setTabbar(from viewController : UIViewController) {
        let tabbar = TabbarController()
        let sceneDelegate = viewController.view.window?.windowScene?.delegate as! SceneDelegate
            sceneDelegate.window?.rootViewController = tabbar
    }
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
}

