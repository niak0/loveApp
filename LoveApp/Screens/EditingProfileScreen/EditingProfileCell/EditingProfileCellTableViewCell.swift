//
//  EditingProfileCellTableViewCell.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 6.08.2023.
//

import UIKit

class EditingProfileCellTableViewCell: UITableViewCell {

    @IBOutlet weak var answerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        answerLabel.layer.cornerRadius = 20
        answerLabel.layer.borderWidth = 2
        answerLabel.layer.borderColor = UIColor.purple.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
