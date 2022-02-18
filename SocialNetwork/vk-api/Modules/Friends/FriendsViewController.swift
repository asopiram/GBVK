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
    private var token: NotificationToken?
    //private var friends: [FriendDTO] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
        
        self.friendsDB.deleteAll()
        
        friendsAPI.getFriends3 { [weak self] friends in
            guard let self = self else { return }
            
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.fetch()
            //self.tableView.reloadData()
            self.token = self.friends?.observe(on: .main, { [weak self] changes in
                 
                 guard let self = self else { return }
                 
                 switch changes {
                 
                 case .initial: self.tableView.reloadData()
                 case .update(_, let deletions, let insertions, let modifications):
                     self.tableView.beginUpdates()
                     self.tableView.insertRows(at: insertions.map({IndexPath(row: $0, section: $0)}), with: .automatic)
                     self.tableView.deleteRows(at: deletions.map({IndexPath(row: $0, section: $0)}), with: .automatic)
                     self.tableView.reloadRows(at: modifications.map({IndexPath(row: $0, section: $0)}), with: .automatic)
                     self.tableView.endUpdates()
                     
                 case .error(let error):
                     print(error)
                 }
             })
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
                //cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
                cell.imageView?.sd_setImage(with: url, completed:  { image, _, _, _ in
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                })
            } 
        }
        return cell
    }
}
