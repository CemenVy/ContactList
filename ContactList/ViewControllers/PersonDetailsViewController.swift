//
//  PersonDetailsViewController.swift
//  ContactList
//
//  Created by Семен Выдрин on 23.08.2023.
//

import UIKit

final class PersonDetailsViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet private var phoneNumberLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    
    //MARK: - Public Properties
    var person: Person!
    
    //MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullName
        phoneNumberLabel.text = "Phone: \(person.phone)"
        emailLabel.text = "Email: \(person.email)"
    }
}
