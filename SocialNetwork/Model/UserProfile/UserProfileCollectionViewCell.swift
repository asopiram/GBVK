//
//  UserProfileCollectionViewCell.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 29.11.2021.
//

import UIKit

class UserProfileCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var UserPhotos: UIImageView!
    @IBOutlet weak var LikeCounter: UILabel!
    @IBOutlet weak var LikeButton: UIButton!
    
    
    @IBAction func LikeButtonPressed(_ sender: Any) {
        if LikeButton.tag == 0 {
            LikeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            LikeButton.configuration?.baseForegroundColor = UIColor.red
            //LikeButton.setTitle("1", for: .normal)
            //LikeButton.setTitleColor(.red, for: .normal)
            LikeButton.tag = LikeButton.tag + 1
            LikeCounter.text = String(LikeButton.tag)
            LikeCounter.textColor = .red

        } else {
            LikeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            LikeButton.configuration?.baseForegroundColor = UIColor.gray
            //LikeButton.setTitle("0", for: .normal)
            LikeButton.tag = LikeButton.tag - 1
            LikeCounter.text = String(LikeButton.tag)
            LikeCounter.textColor = .black
        
        }
            
    }
    
}
 
