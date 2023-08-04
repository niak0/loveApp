//
//  CardModel.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 4.08.2023.
//

import UIKit

protocol ConvertCardModel {
    func convertCardModel() -> CardModel
}

struct CardModel {
    var feedImages : [UIImage]
    var feedText : NSAttributedString
}
