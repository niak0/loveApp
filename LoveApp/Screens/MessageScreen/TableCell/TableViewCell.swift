//
//  TableViewCell.swift
//  LoveApp
//
//  Created by Okan Erdinç Arslan on 2.08.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var messageInfoLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var profileIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileIcon.layer.cornerRadius = profileIcon.frame.size.width / 2
        messageInfoLbl.layer.masksToBounds = true
        messageInfoLbl.layer.cornerRadius = messageInfoLbl.frame.size.width / 2
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
