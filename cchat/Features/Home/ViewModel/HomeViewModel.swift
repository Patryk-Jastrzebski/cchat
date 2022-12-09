//
//  HomeViewModel.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 09/12/2022.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var isBottomSheetPresented = false
    @Published var user: User = .base
    @AppStorage(AppStorageVariables.loginStatus) var userLoggedIn = false
    
    func getUserData() {
        if let email = API.auth.currentUser?.email {
            user.email = email
        }
    }
    
    @MainActor
    func logoutUser() {
        Task {
            do {
                try API.auth.signOut()
                withAnimation(.easeInOut(duration: 0.5)) {
                    userLoggedIn = false
                }
            } catch {
                
            }
        }
    }
}
