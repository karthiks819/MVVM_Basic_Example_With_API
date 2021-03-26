//
//  ContactsModel.swift
//  MVVMSample
//
//  Created by Karthik on 26/03/21.
//

import Foundation

struct ContactsModel:Codable {
    var contacts: [Contacts]
}

struct Contacts:Codable {
    var name, email: String
}
