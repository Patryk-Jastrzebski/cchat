//
//  ContentView.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State var appState: AppState = .login
    @State var isDebuggerOpened = false
    @AppStorage(AppStorageVariables.loginStatus) var userLoggedIn = false
    var body: some View {
        ZStack {
            if userLoggedIn {
                Home()
                    .transition(.backslide)
            } else {
                LoginMainScreen()
            }
        }
        .sheet(isPresented: $isDebuggerOpened) {
            Debugger()
        }
        .onShake {
            isDebuggerOpened.toggle()
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
