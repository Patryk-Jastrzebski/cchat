//
//  Password.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 13/11/2022.
//

import SwiftUI

struct Password: View {
    @StateObject var viewModel: SignInViewModel
    @FocusState var isFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            previousButton
            passwordView
            navigationAction
        }
        .navigationBarHidden(true)
    }
}

struct Password_Previews: PreviewProvider {
    static var previews: some View {
        Password(viewModel: SignInViewModel(user: User.base))
            .preferredColorScheme(.dark)
    }
}

extension Password {
    private var passwordView: some View {
        VStack(spacing: 5) {
            welcomeMessage
            welcomeTitle
            emailName
            welcomeSubtitle
            passwordTextField
            forgotPassword
            Spacer()
            loginButton
        }
    }
    
    private var welcomeMessage: some View {
        Text(Strings.Password.Welcome.message)
            .font(.system(size: 12))
            .foregroundColor(.secondary)
    }
    
    private var emailName: some View {
        Text(viewModel.user.email)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical, 5)
    }
    
    private var welcomeTitle: some View {
        Text(Strings.Password.Welcome.title)
            .font(.system(size: 26))
            .fontWeight(.bold)
    }
    
    private var welcomeSubtitle: some View {
        Text(Strings.Password.Welcome.subtitle)
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .frame(height: 45)
    }
    
    private var passwordTextField: some View {
        CustomTextfield(text: $viewModel.password, placeholder: Strings.Password.TextField.password, textfieldState: .secure)
            .focused($isFocused)
            .textContentType(.password)
            .onAppear {
                isFocused = true
            }
    }
    
    private var forgotPassword: some View {
        VStack {
            switch viewModel.state {
            case .error(let error):
                Text(error)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            default:
                EmptyView()
            }
            NavigationLink(destination: { EmptyView() }, label: {
                Text(Strings.Password.Button.forgot)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
            })
        }
    }
    
    private var loginButton: some View {
        Button(action: {
            viewModel.authorizeUser()
        }, label: {
            loginButtonView
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.white)
                .cornerRadius(10)
                .padding()
        })
    }
    
    private var loginButtonView: some View {
        HStack {
            if viewModel.state == .loading {
                LoadingIndicator(color: .black)
            } else {
                Image(systemName: "lock.open.fill")
                Text(Strings.Password.Button.login)
            }
        }
    }
    
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
    
    private var navigationAction: some View {
        NavigationLink(isActive: $viewModel.presentNextScene, destination: {
            EmptyView()
        }, label: {})
    }
}
