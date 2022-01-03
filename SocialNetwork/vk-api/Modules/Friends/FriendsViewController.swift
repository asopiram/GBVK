//
//  FriendsViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/19/21.
//

import UIKit
import SDWebImage

final class FriendsViewController: UITableViewController {

    private var friendsAPI = FriendsAPI()
    
    private var friends: [FriendDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
        
        friendsAPI.getFriends3 { [weak self] friends in
            guard let self = self else { return }
            
            self.friends = friends
            self.tableView.reloadData()
        }
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        let friend: FriendDTO = friends[indexPath.row]
        
        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        
        
        if let url = URL(string: friend.photo100) {
            //cell.imageView?.sd_setImage(with: url, completed: nil)
            cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        } else {
            cell.imageView?.image = UIImage(named: "NoPhoto")//если ее нет, ставим дефолтную
        }

        return cell
    }
    

}
