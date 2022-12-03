//
//  User.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

import Foundation

struct User {
    static let base = User(email: "", name: "", phoneNumber: nil, preferences: "", birthDate: "", isFirstConfigure: true)
    
    var email: String
    var name: String
    var phoneNumber: Int?
    var preferences: String
    var birthDate: String
    var isFirstConfigure: Bool
}
