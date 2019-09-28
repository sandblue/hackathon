//
//  contactObj.swift
//  hackthon
//
//  Created by GDG on 28/9/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit
import ContactsUI
class contactObj: NSObject {
    
    static let sharedInstance = contactObj()
    
    var contactNumber:String?
    var contactName:String?
    
    
    func getContact(completion: @escaping (Bool, [contactObj]) -> ()){
        var dataArray = [contactObj]()
        let contactStore = CNContactStore()
        var contacts = [CNContact]()
        let keys = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                        CNContactPhoneNumbersKey,
                        CNContactEmailAddressesKey
                ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        do {
            try contactStore.enumerateContacts(with: request){
                    (contact, stop) in
                // Array containing all unified contacts from everywhere
                contacts.append(contact)
                for phoneNumber in contact.phoneNumbers {
                    if let number = phoneNumber.value as? CNPhoneNumber, let label = phoneNumber.label {
                        let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
                        print("\(contact.givenName) \(contact.familyName) tel:\(localizedLabel) -- \(number.stringValue), email: \(contact.emailAddresses)")
                        
                        let obj = contactObj()
                        obj.contactName = contact.givenName
                        obj.contactNumber = number.stringValue
                        
                        dataArray.append(obj)
                        completion(true, dataArray)
                    }
                }
            }
            
        } catch {
            print("unable to fetch contacts")
        }
    }
    
}
