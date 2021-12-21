//
//  AllGroupTableViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 30.11.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController {

    var Group = AllGroup()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1//создаем одну секцию
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Group.AllGroupArray.count//возвращаем количество ячеек таблицы, равное количеству элементов в массиве groups
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as! AllGroupTableViewCell // Получаем ячейку из пула
        let group = Group.AllGroupArray[indexPath.row]// Получаем группу для конкретной строки
        
        cell.GroupName.text = group.groupName
        if cell.GroupName.text == "" {//делаем проверку на наличие имени
            cell.GroupName.text = "No name" //если имени нет - выдаем No name
        }
        
        cell.GroupLogo.layer.cornerRadius = 60/2
        cell.GroupLogo.contentMode = .scaleToFill
        cell.GroupLogo.image = UIImage(named: group.groupImage)
        if UIImage(named: group.groupImage) == nil {//делаем проверку на наличие фотки
            cell.GroupLogo.image = UIImage(named: "NoLogo")//если ее нет, ставим дефолтную
        }
        
     return cell

    }

    
}
