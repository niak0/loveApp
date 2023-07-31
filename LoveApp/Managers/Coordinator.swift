import UIKit

class Coordinator {
    enum Screen {
        case loginVC
        case homeVC
    }
    
    let navigationController : UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func viewController(for screen: Screen) -> UIViewController {
            switch screen {
            case .loginVC:
                return LoginVC()
            case .homeVC:
                return HomeVC()
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
    
}

