//
//  Persons.swift
//  ContactList
//
//  Created by Семен Выдрин on 22.08.2023.
//


struct Person {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    static func getPersonList(from dataStore: DataStore) -> [Person] {
        var persons: [Person] = []
        
        var shuffledFirstName = dataStore.firstNames.shuffled()
        var shuffledLastName = dataStore.lastNames.shuffled()
        var shuffledPhoneNumber = dataStore.phoneNumbers.shuffled()
        var shuffledEmail = dataStore.emails.shuffled()
        
        let availableCount = min(
            shuffledFirstName.count,
            shuffledLastName.count,
            shuffledPhoneNumber.count,
            shuffledEmail.count
        )
        
        while persons.count < availableCount,
              let firstName = shuffledFirstName.popLast(),
              let lastName = shuffledLastName.popLast(),
              let phoneNumber = shuffledPhoneNumber.popLast(),
              let email = shuffledEmail.popLast() {
            
            let person = Person(
                firstName: firstName,
                lastName: lastName,
                phoneNumber: phoneNumber,
                email: email
            )
            persons.append(person)
        }
        return persons
    }
}
