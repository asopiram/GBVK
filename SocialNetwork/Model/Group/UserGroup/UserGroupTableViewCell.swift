//
//  UserGroupTableViewCell.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 30.11.2021.
//

import UIKit

class UserGroupTableViewCell: UITableViewCell {

    
    @IBOutlet weak var UserGroupLogo: UIImageView!
    @IBOutlet weak var UserGroupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
