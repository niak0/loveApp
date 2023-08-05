
import UIKit

protocol TurnCustomViewModel {
    func turnCustomViewModel() -> CustomViewModel
}

protocol CustomViewModelDelegate: AnyObject {
//    func userModelDidUpdate(_ viewModel: CustomViewModel)
    func imageIndexDidUpdate(_ index: Int, _ image: UIImage)
}
class CustomViewModel {
    var photos: [UIImage]
    var infoAttrText : NSAttributedString
    var textAligment : NSTextAlignment
    var model: Any?
    
    weak var delegate : CustomViewModelDelegate?
    
    init(photos: [UIImage], personalInfos: NSAttributedString, textAligment: NSTextAlignment, model: Any) {
        self.photos = photos
        self.infoAttrText = personalInfos
        self.textAligment = textAligment
        self.model = model
    }
    
    private var imageIndex = 0 {
        didSet {
            let images = photos[imageIndex]
            delegate?.imageIndexDidUpdate(imageIndex, images)
//            imageIndexObserver?(imageIndex, images)
        }
    }
    
//    var imageIndexObserver : ( (Int, UIImage) -> () )?
    
    func nextPhoto() {
        imageIndex = imageIndex + 1 >= photos.count ? 0 : imageIndex + 1
    }
    func previousPhoto() {
        imageIndex = imageIndex - 1 < 0 ? photos.count - 1 : imageIndex - 1
    }
        
}
