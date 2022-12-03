//
//  Login.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

import SwiftUI
import FirebaseAuth

struct Email: View {
    @StateObject var viewModel = EmailViewModel()
    @FocusState var isFocused: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            previousButton
            emailView
            navigationAction
        }
        .navigationBarHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Email()
            .preferredColorScheme(.dark)
    }
}

extension Email {
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
    
    private var emailView: some View {
        VStack(spacing: 5) {
            welcomeMessage
            welcomeTitle
            welcomeSubtitle
            loginTextField
            forgotPassword
            Spacer()
            loginButton
        }
    }
    
    private var welcomeMessage: some View {
        Text(Strings.Login.Welcome.message)
            .font(.system(size: 12))
            .foregroundColor(.secondary)
    }
    
    private var welcomeTitle: some View {
        Text(Strings.Login.Welcome.title)
            .font(.system(size: 26))
            .fontWeight(.bold)
    }
    
    private var welcomeSubtitle: some View {
        Text(Strings.Login.Welcome.subtitle)
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .frame(height: 45)
            .padding()
    }
    
    private var loginTextField: some View {
        CustomTextfield(text: $viewModel.user.email, placeholder: Strings.Login.TextField.email, textfieldState: .notsecure)
            .focused($isFocused)
            .textContentType(.emailAddress)
            .onAppear {
                isFocused = true
            }
    }
    
    private var forgotPassword: some View {
        NavigationLink(destination: { EmptyView() }, label: {
            Text(Strings.Login.Button.forgot)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding(.vertical, 10)
        })
    }
    
    private var loginButton: some View {
        Button {
            Task {
                await viewModel.checkEmailExist()
            }
        } label: {
            loginButtonView
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.white)
                .cornerRadius(10)
                .padding()
        }
    }
    
    private var loginButtonView: some View {
        HStack {
            if viewModel.isLoading == .loading {
                LoadingIndicator(color: .black)
            } else {
                Text(Strings.Login.Button.login)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.forward")
            }
        }
    }
    
    private var navigationAction: some View {
        NavigationLink(isActive: $viewModel.presentNextScene, destination: {
            switch viewModel.accountState {
            case .exist:
                Password(viewModel: SignInViewModel(user: viewModel.user))
            case .notExist:
                AddNameView(user: viewModel.user)
            case .none:
                EmptyView()
            }
        }, label: {})
    }
}
