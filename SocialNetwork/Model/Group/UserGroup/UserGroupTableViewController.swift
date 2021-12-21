//
//  UserGroupTableViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 30.11.2021.
//

import UIKit

class UserGroupTableViewController: UITableViewController {

    var UserGroup = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserGroup.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroupCell", for: indexPath) as! UserGroupTableViewCell // Получаем ячейку из пула
        let group = UserGroup[indexPath.row] // Получаем группу для конкретной строки
        cell.UserGroupName.text = group // Устанавливаем группу в надпись ячейки
//        cell.MyGroupLogo.image = UIImage(named: group)
        cell.UserGroupLogo.image = UIImage(named: group)
        cell.UserGroupLogo.layer.cornerRadius = 60/2
        cell.UserGroupLogo.contentMode = .scaleAspectFill
        
        if UIImage(named: group) == nil {
        cell.UserGroupLogo.image = UIImage(named: "NoLogo")
        }
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {// Если была нажата кнопка «Удалить»
         UserGroup.remove(at: indexPath.row) // Удаляем город из массива
         tableView.deleteRows(at: [indexPath], with: .fade)// И удаляем строку из таблицы
        }
    }
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue){
        
        if segue.identifier == "addGroup" {// Проверяем идентификатор, чтобы убедиться, что это нужный переход
            guard let allGroupsTableViewController = segue.source as? AllGroupTableViewController  // Получаем ссылку на контроллер, с которого осуществлен переход
            else {
                return
            }
            
            if let indexPath = allGroupsTableViewController.tableView.indexPathForSelectedRow {// Получаем индекс выделенной ячейки
                let group = allGroupsTableViewController.Group.AllGroupArray[indexPath.row] // Получаем город по индексу
                if !UserGroup.contains(group.groupName) { // Проверяем, что такой группы нет в списке
                    UserGroup.append(group.groupName)// Добавляем группу в список выбранных
                    tableView.reloadData()// Обновляем таблицу
                }
            }
        }
    }


}
