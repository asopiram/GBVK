//
//  UserProfileViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 29.11.2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    var avatarImage: UIImage?
    
    @IBOutlet weak var UserCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // это если не в коллекцию добавлять, а во View
        // UserProfilePhoto.image = avatarImage

        UserCollectionView.delegate = self
        UserCollectionView.dataSource = self
    }

}


extension UserProfileViewController: UICollectionViewDelegate{
        
}


extension UserProfileViewController: UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCollectionCell", for: indexPath) as! UserProfileCollectionViewCell //else {
            //return UICollectionViewCell()
        //}
        
        cell.UserPhotos.image = avatarImage
    
        return cell
    }
}
