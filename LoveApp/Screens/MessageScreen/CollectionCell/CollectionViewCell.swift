//
//  CollectionViewCell.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 2.08.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var profileIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileIcon.layer.cornerRadius = profileIcon.frame.size.width / 2
        profileIcon.clipsToBounds = true
    }

}
