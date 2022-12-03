//
//  cchatApp.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

import SwiftUI
import Firebase

@main
struct cchatApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
