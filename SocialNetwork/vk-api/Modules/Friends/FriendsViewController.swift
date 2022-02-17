//
//  FriendsViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/19/21.
//

import UIKit
import SDWebImage
import RealmSwift

final class FriendsViewController: UITableViewController {

    private var friendsAPI = FriendsAPI()
    private var friendsDB = FriendsDB()
    private var friends: Results<FriendsDAO>?
    //private var friends: [FriendDTO] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
        
        friendsDB.deleteAll()
        
        friendsAPI.getFriends3 { [weak self] friends in
            guard let self = self else { return }
            
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.fetch()
            self.tableView.reloadData()
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let friends = friends else { return 0 }
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        if let friend = friends?[indexPath.row]{
        
            cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
            
            if let url = URL(string: friend.photo100) {
                //cell.imageView?.sd_setImage(with: url, completed: nil)
                cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
            } else {
                cell.imageView?.image = UIImage(named: "NoPhoto")//если ее нет, ставим дефолтную
            }
        }
        return cell
    }
}
