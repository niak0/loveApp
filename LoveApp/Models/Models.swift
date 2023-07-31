import UIKit

protocol ConvertCardModel {
    func convertCardModel() -> CardModel
}

struct CardModel {
    var feedImages : [UIImage]
    var feedText : NSAttributedString
}

struct UserModel {
    let userName : String
    let userAge : Int
    let userLocation : String
    let userImages : [UIImage]
}

struct AdsModel {
    var adTitle : String
    var adSubtitle : String
    var adImages : [UIImage]
}


