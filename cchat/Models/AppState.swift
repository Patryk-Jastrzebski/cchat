//
//  AppState.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 14/11/2022.
//

import Foundation

enum AppState {
    case login
    case homeScreen
}

enum LoginState: Equatable {
    static func == (lhs: LoginState, rhs: LoginState) -> Bool {
        false
    }
    
    case start
    case email
    case password(User)
    case createPassword
    case profileConfigurationName
    case profileConfigurationBirthday
    case success
}
