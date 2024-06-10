//
//  USer.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 07/05/2024.


import Foundation
import SwiftUI

struct User : Identifiable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let ighandle: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: firstName + " " + lastName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: UUID().uuidString, firstName: "Avazbek", lastName: "Isroilov", email: "isroilovavazbek2002@gmail.com", ighandle: "student.cali.2002")
}

