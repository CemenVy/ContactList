//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Семен Выдрин on 22.08.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {
    
    var persons: [Person]!
    
//MARK: - UITabelViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = persons[indexPath.row]
        
        var content = personCell.defaultContentConfiguration()
        content.text = person.fullName
        
        personCell.contentConfiguration = content
        return personCell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let personDetailsVC = segue.destination as? PersonDetailsViewController
        personDetailsVC?.person = persons[indexPath.row]
    }
    
}
