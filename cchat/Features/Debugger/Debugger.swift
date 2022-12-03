//
//  Debugger.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 29/11/2022.
//

import SwiftUI

struct Debugger: View {
    @AppStorage(AppStorageVariables.loginStatus) var userLogged = false
    var body: some View {
        Text("Witaj w debuggerze!")
        Button("Toggle uzytkownika") {
            userLogged.toggle()
        }
    }
}

struct Debugger_Previews: PreviewProvider {
    static var previews: some View {
        Debugger()
    }
}
