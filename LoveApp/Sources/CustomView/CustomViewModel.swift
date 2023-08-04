
import UIKit

protocol TurnCustomViewModel {
    func turnCustomViewModel() -> CustomViewModel
}

class CustomViewModel {
    var photos: [UIImage]
    var infoAttrText : NSAttributedString
    var textAligment : NSTextAlignment
    
    init(photos: [UIImage], personalInfos: NSAttributedString, textAligment: NSTextAlignment) {
        self.photos = photos
        self.infoAttrText = personalInfos
        self.textAligment = textAligment
    }
        
}
