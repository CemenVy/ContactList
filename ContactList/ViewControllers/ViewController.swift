//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Семен Выдрин on 22.08.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {
    private var personList = Person.getPersonList(from: DataStore(), of: 12)

}
//MARK: - UITabelViewDataSource
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = personList[indexPath.row]
        
        var content = personCell.defaultContentConfiguration()
        content.text = person.fullName
        
        personCell.contentConfiguration = content
        return personCell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = personList.remove(at: sourceIndexPath.row)
        personList.insert(currentPerson, at: destinationIndexPath.row)
    }
}
//MARK: - UITabelViewDelegate
extension ContactListViewController {
    
}
