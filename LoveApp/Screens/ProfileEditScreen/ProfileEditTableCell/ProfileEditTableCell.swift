//
//  ProfileEditTableCell.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 4.08.2023.
//

import UIKit

class ProfileEditTableCell: UITableViewCell {

    @IBOutlet weak var infoResult: UILabel!
    @IBOutlet weak var infoName: UILabel!
    @IBOutlet weak var infoIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
