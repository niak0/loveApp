//
//  UIColor+Extension.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 31.07.2023.
//

import UIKit

extension UIColor {
    static func rgb(red : CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
