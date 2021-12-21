//
//  AllGroupTableViewCell.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 30.11.2021.
//

import UIKit

class AllGroupTableViewCell: UITableViewCell {

    
    @IBOutlet weak var GroupLogo: UIImageView!
    @IBOutlet weak var GroupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
