//
//  UserFriendsViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/15/21.
//

import UIKit
import SDWebImage

final class UserFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var oldfriends = UserFriends()
    
    @IBOutlet weak var UserFriendsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserFriendsTableView.delegate = self
        UserFriendsTableView.dataSource = self
            
        //self.UserFriendsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oldfriends.UserFriendsArray.count
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! UserFriendsTableViewCell
        let friend = oldfriends.UserFriendsArray[indexPath.row]
        
        cell.backgroundColor = .clear //очищаем фон у ячейки
        cell.FriendName.textColor = .black
        
        if cell.FriendName.text == "" {//делаем проверку на наличие имени
            cell.FriendName.text = "No name"//если имени нет - выдаем No name
        } else {
        cell.FriendName.text = friend.userName// если все ок - то вносим имя
            
        }
        
        cell.FriendImageShadow.backgroundColor = .clear
        cell.FriendImageShadow.layer.shadowColor = UIColor.red.cgColor
        cell.FriendImageShadow.layer.shadowOpacity = 1
        cell.FriendImageShadow.layer.shadowRadius = 8
        cell.FriendImageShadow.layer.shadowOffset = CGSize.zero
        
        
        cell.FriendImage.layer.cornerRadius = 60/2
        cell.FriendImage.contentMode = .scaleToFill
        //cell.FriendImage.backgroundColor = .clear
    
        if UIImage(named: friend.userImage) == nil {//делаем проверку на наличие фотки
            cell.FriendImage.image = UIImage(named: "NoPhoto")//если ее нет, ставим дефолтную
        } else {
            cell.FriendImage.image = UIImage(named: friend.userImage)// если все ок, то ставим фотку
        }
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UserFriendsTableViewCell else {
            return
        }
        guard let photoFriend = segue.destination as? UserProfileViewController else {
            return
        }
        photoFriend.avatarImage = cell.FriendImage.image
        
    }
}


