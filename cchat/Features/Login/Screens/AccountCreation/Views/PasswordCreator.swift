//
//  PasswordCreator.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 21/11/2022.
//

import SwiftUI

struct PasswordCreator: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AccountCreatorViewModel
    
    var body: some View {
        ZStack {
            previousButton
            createAccountView
        }
        .sheet(isPresented: $viewModel.termsSheet) {
            
        }
        .navigationBarHidden(true)
    }
}

struct PasswordCreator_Previews: PreviewProvider {
    static var previews: some View {
        PasswordCreator(viewModel: AccountCreatorViewModel(user: User.base))
            .preferredColorScheme(.dark)
    }
}

extension PasswordCreator {
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
            password
            repeatPassword
            errorMessages
            Spacer()
            continueInformation
            continueButton
        }
    }
    
    private var welcomeMessage: some View {
        Text("JOIN US!")
            .font(.system(size: 12))
            .foregroundColor(.secondary)
    }
    
    private var welcomeTitle: some View {
        Text("That will be our secret 🥷")
            .font(.system(size: 26))
            .fontWeight(.bold)
            .padding(.top, 50)
    }
    
    private var welcomeSubtitle: some View {
        Text("We just want to meet you better")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .frame(height: 45)
    }
    
    private var password: some View {
        CustomTextfield(text: $viewModel.password, placeholder: "Password", textfieldState: .secure)
            .textContentType(.password)
    }
    
    private var repeatPassword: some View {
        CustomTextfield(text: $viewModel.repeatPassword, placeholder: "Repeat password", textfieldState: .secure)
    }
    
    private var errorMessages: some View {
        ZStack {
            if viewModel.state == .error(.passwordNotMeetRequirements) {
                passwordRequirementsError
            } else if viewModel.state == .error(.passwordDifference) {
                passwordDifferenceError
            } else if viewModel.state == .error(.apiError) {
                apiErrorMessage
            }
        }
    }
    
    private var continueInformation: some View {
        Button("If you continue - you accept the term of use app.") {
            viewModel.termsSheet.toggle()
        }
        .foregroundColor(.cyan)
        .font(.system(size: 14, weight: .semibold))
        .frame(width: 200)
    }
    
    private var passwordDifferenceError: some View {
        Text("Passwords are diffrent")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundColor(.red)
    }
    
    private var passwordRequirementsError: some View {
        Text("Password must be min. 8 characters")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundColor(.red)
    }
    
    private var apiErrorMessage: some View {
        Text("SERVER ERROR")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundColor(.cyan)
    }
    
    private var continueButton: some View {
        Button {
            viewModel.createUser()
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
