//
//  Home.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 20/11/2022.
//

import SwiftUI

struct Home: View {
    @AppStorage(AppStorageVariables.loginStatus) var userLoggedIn = false
    var body: some View {
        VStack {
            Text("Witaj kozaku")
            Button("logout") {
                Task {
                    do {
                        try API.auth.signOut()
                    } catch {
                        
                    }
                }
                withAnimation {
                    userLoggedIn = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
