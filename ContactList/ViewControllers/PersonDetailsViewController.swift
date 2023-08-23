//
//  PersonDetailsViewController.swift
//  ContactList
//
//  Created by Семен Выдрин on 23.08.2023.
//

import UIKit

final class PersonDetailsViewController: UIViewController {

    @IBOutlet private var phoneNumberLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullName
        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}
