//
//  LoginViewModel.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

import SwiftUI
import Firebase

final class EmailViewModel: ObservableObject {
    enum AccountState {
        case none
        case notExist
        case exist
    }
    
    enum State {
        case notLoaded
        case loaded
        case loading
        case error
    }
    
    @Published var user = User.base
    @Published var accountState: AccountState = .none
    @Published var isLoading: State = .notLoaded
    @Published var presentNextScene = false
    
    private let service: LoginNetworkService
    
    init(service: LoginNetworkService = LoginNetworkServiceImpl.shared) {
        self.service = service
    }
    
    @MainActor
    func checkEmailExist() async {
        do {
            isLoading = .loading
            let email = try await service.fetchEmailExist(email: user.email)
            if email {
                withAnimation {
                    accountState = .exist
                }
            } else {
                withAnimation {
                    accountState = .notExist
                }
            }
        } catch {
            isLoading = .error
            print(error.localizedDescription)
            return
        }
        presentNextScene = true
        isLoading = .loaded
    }
    
    func isAccountState(_ accountState: AccountState) -> Bool {
        return self.accountState == accountState
    }
}
