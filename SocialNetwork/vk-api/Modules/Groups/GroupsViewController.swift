//
//  GoupsViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/21/21.
//

import UIKit
import SDWebImage
import RealmSwift

class GroupsViewController: UITableViewController {

    private var groupsAPI = GroupsAPI()
    private var groupsDB = GroupsDB()
    private var groups: Results<GroupsDAO>?
    //private var groups: [GroupsDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GroupCell")
        
        groupsDB.deleteAll()
        
        groupsAPI.getGroups { [weak self] groups in
            guard let self = self else { return }
            
            self.groupsDB.save(groups)
            self.groups = self.groupsDB.fetch()
            self.tableView.reloadData()
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let groups = groups else { return 0 }
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        
        if let group = groups?[indexPath.row] {
            
            cell.textLabel?.text = "\(group.name)"
            
            if let url = URL(string: group.photo100) {
                cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
            } else {
                cell.imageView?.image = UIImage(named: "NoLogo")
            }
        }
        return cell
    }
}

