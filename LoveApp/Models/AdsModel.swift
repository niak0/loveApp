//
//  AdsModel.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 4.08.2023.
//

import UIKit

struct AdsModel: TurnCustomViewModel {
    
    var adTitle : String
    var adSubtitle : String
    var adImages : [UIImage]
    
    func turnCustomViewModel() -> CustomViewModel {
        let attrText = NSMutableAttributedString(string: adTitle, attributes: [
            .font : UIFont.systemFont(ofSize: 30, weight: .heavy),
            .backgroundColor : UIColor.red])
        attrText.append(NSAttributedString(string: "\n\(adSubtitle)", attributes: [
            .font : UIFont.systemFont(ofSize: 20, weight: .regular),
            .backgroundColor : UIColor.darkGray]))
        return CustomViewModel(photos: adImages, personalInfos: attrText, textAligment: .center)
    }

}
