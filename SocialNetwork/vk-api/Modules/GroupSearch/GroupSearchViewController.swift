//
//  GroupSearchViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/21/21.
//

import UIKit

class GroupSearchViewController: UITableViewController {

    private var groupSearchAPI = GroupSearchAPI()
    
    private var groupSearch: [GroupSearchDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GroupSearchCell")
        
        groupSearchAPI.getGroupSearch() { [weak self] groupSearch in
            guard let self = self else { return }
            
            self.groupSearch = groupSearch
            self.tableView.reloadData()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupSearch.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupSearchCell", for: indexPath)

        let lookForGroup: GroupSearchDTO = groupSearch[indexPath.row]
        
        cell.textLabel?.text = "\(lookForGroup.name)"
        
        if let url = URL(string: lookForGroup.photo100) {
            cell.imageView?.sd_setImage(with: url, completed:  { image, _, _, _ in
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
        } else {
            cell.imageView?.image = UIImage(named: "NoLogo")
        }


        return cell
    }

}
