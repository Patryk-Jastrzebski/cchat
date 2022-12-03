//
//  CreateAccount.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 13/11/2022.
//

import SwiftUI

struct AddNameView: View {
    @FocusState var isFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    @State var user: User
    
    var body: some View {
        ZStack {
            previousButton
            createAccountView
        }
        .navigationBarHidden(true)
    }
}

struct AddNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddNameView(user: User.base)
    }
}

extension AddNameView {
    private var previousButton: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.primary)
                        .font(.system(size: 22))
                })
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
    
    private var createAccountView: some View {
        VStack {
            welcomeMessage
            welcomeTitle
            welcomeSubtitle
            nameTextfield
            Spacer()
            continueButton
        }
    }
    
    private var welcomeMessage: some View {
        Text("JOIN US!")
            .font(.system(size: 12))
            .foregroundColor(.secondary)
    }
    
    private var welcomeTitle: some View {
        Text("What is your name?")
            .font(.system(size: 26))
            .fontWeight(.bold)
    }
    
    private var welcomeSubtitle: some View {
        Text("We just want to meet you better")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .frame(height: 45)
    }
    
    private var nameTextfield: some View {
        TextField("NAME", text: $user.name)
            .font(.system(size: 32, weight: .bold))
            .multilineTextAlignment(.center)
            .focused($isFocused)
            .onAppear {
                isFocused = true
            }
    }
    
    private var continueButton: some View {
        NavigationLink {
            BirthDateView(user: user)
        } label: {
            HStack {
                Text(Strings.Login.Button.login)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.forward")
            }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
        }
    }
}
