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
    
    static func getPersonList(from dataStore: DataStore, of count: Int) -> [Person] {
        var personList: [Person] = []
        
        var shuffledFirstName = dataStore.firstNames.shuffled()
        var shuffledLastName = dataStore.lastNames.shuffled()
        var shuffledPhoneNumber = dataStore.phoneNumbers.shuffled()
        var shuffledEmail = dataStore.emails.shuffled()
        
        while personList.count < count,
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
            personList.append(person)
        }
        return personList
    }
}
