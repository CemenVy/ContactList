//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Семен Выдрин on 27.08.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    // MARK: - Private Properties
    private func setupViewControllers() {
        guard let contactListVC = viewControllers?.first as? ContactListViewController else { return }
        guard let sectionVC = viewControllers?.last as? SectionTableViewController else { return }
        
        let person = Person.getContactList()
        contactListVC.persons = person
        sectionVC.persons = person
    }
}
