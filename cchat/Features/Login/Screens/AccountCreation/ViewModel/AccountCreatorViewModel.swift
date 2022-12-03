//
//  PasswordViewModel.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 13/11/2022.
//

import SwiftUI

final class AccountCreatorViewModel: ObservableObject {
    enum State: Equatable {
        case notLoaded, loading, success, error(ErrorType)
    }
    
    enum ErrorType {
        case passwordDifference, passwordNotMeetRequirements, apiError
    }
    
    @Published var user: User
    @Published var state: State = .notLoaded
    @Published var presentNextScene = false
    @Published var password = ""
    @Published var repeatPassword = ""
    @Published var termsSheet = false
    
    @AppStorage(AppStorageVariables.loginStatus) var userLoggedIn = false
    
    init(user: User) {
        self.user = user
    }
    
    func createUser() {
        if password.count < 8 {
            state = .error(.passwordNotMeetRequirements)
            return
        }
        
        if password != repeatPassword {
            state = .error(.passwordDifference)
            return
        }
        
        state = .loading
        API.auth.createUser(withEmail: user.email, password: password) { response, error in
            if let error = error {
                print(error.localizedDescription)
                self.state = .error(.apiError)
                return
            }
            
            if let response = response {
                print(response)
                self.state = .success
                self.presentNextScene = true
                self.userLoggedIn = true
                return
            }
        }
    }
}
