//
//  UserFriendsTableViewCell.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 29.11.2021.
//

import UIKit

class UserFriendsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var FriendImageShadow: UIView!
    @IBOutlet weak var FriendImage: UIImageView!
    @IBOutlet weak var FriendName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
