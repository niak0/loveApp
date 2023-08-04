import UIKit

struct UserModel: TurnCustomViewModel {
    let userName : String 
    let userAge : Int
    let userLocation : String
    let city : String
    let userImages : [UIImage]
    let userBasicAbout: UserBasicAboutModel
    let userMoreAbout: UserMoreAboutModel
    
    func turnCustomViewModel() -> CustomViewModel {
        let attrText = NSMutableAttributedString(string: userName, attributes: [.font : UIFont.systemFont(ofSize: 30, weight: .heavy)])
        attrText.append(NSAttributedString(string: " \(userAge)", attributes: [.font : UIFont.systemFont(ofSize: 23, weight: .regular)]))
        attrText.append(NSAttributedString(string: "\nLive in \(city)", attributes: [.font : UIFont.systemFont(ofSize: 18, weight: .regular)]))
        attrText.append(NSAttributedString(string: "\n\(userLocation) km away", attributes: [.font : UIFont.systemFont(ofSize: 18, weight: .regular)]))
        return CustomViewModel(photos: userImages, personalInfos: attrText, textAligment: .left)
    }
}
struct UserBasicAboutModel {
    let lookingFor : String
    let work : String
    let education : String
    let gender : String
}
struct UserMoreAboutModel {
    let height : String
    let exercise : String
    let drinking : String
    let smoking : String
    let sleepingHabbits : String
    let dietaryPreference : String
    let religion : String
    let politics : String
    let starSign : String
}




