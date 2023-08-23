//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Семен Выдрин on 22.08.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {
    private var person = Person.getPersonList(from: DataStore())
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let personDetailsVC = segue.destination as? PersonDetailsViewController
        personDetailsVC?.person = person[indexPath.row]
    }
}

//MARK: - UITabelViewDataSource
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        person.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = person[indexPath.row]
        
        var content = personCell.defaultContentConfiguration()
        content.text = person.fullName
        
        personCell.contentConfiguration = content
        return personCell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = person.remove(at: sourceIndexPath.row)
        person.insert(currentPerson, at: destinationIndexPath.row)
    }
}
