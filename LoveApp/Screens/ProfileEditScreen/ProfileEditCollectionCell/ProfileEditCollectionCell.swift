//
//  ProfileEditCollectionCell.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 6.08.2023.
//

import UIKit

class ProfileEditCollectionCell: UICollectionViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImage.fullSuperView()
    }

}
