//
//  SignInViewModel.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 03/12/2022.
//

import SwiftUI

final class SignInViewModel: ObservableObject {
    enum State: Equatable {
        case notLoaded, loading, success, error(String)
    }
    
    @Published var user: User
    @Published var state: State = .notLoaded
    @Published var presentNextScene = false
    @Published var password = ""
    
    @AppStorage(AppStorageVariables.loginStatus) var userLoggedIn = false
    
    init(user: User) {
        self.user = user
    }
    
    func authorizeUser() {
        state = .loading
        API.auth.signIn(withEmail: user.email, password: password) { response, error in
            if let error = error {
                print(error.localizedDescription)
                self.state = .error(error.localizedDescription)
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
