//
//  GoupsViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/21/21.
//

import UIKit

class GoupsViewController: UITableViewController {

    private var groupsAPI = GroupsAPI()
    
    private var groups: [GroupsDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GroupCell")
        
        groupsAPI.getGroups { [weak self] groups in
            guard let self = self else { return }
            
            self.groups = groups
            self.tableView.reloadData()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        
        let group: GroupsDTO = groups[indexPath.row]
        
        cell.textLabel?.text = "\(group.name)"
        
        if let url = URL(string: group.photo100) {
            cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        } else {
            cell.imageView?.image = UIImage(named: "NoLogo")
        }

        return cell
    }

}
