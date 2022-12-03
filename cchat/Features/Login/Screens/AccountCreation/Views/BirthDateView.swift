//
//  BirthDateView.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 21/11/2022.
//

import SwiftUI

struct BirthDateView: View {
    enum BirthField: Hashable {
        case day, month, year
    }
    
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: BirthField?
    
    @State private var isContinueButtonEnabled = false
    @State private var isDateErrorTextEnabled = false
    @State private var birthDay = Birthday.base
    @State var user: User
    
    var body: some View {
        ZStack {
            previousButton
            createBirthDate
        }
        .navigationBarHidden(true)
    }
}

struct BirthDateView_Previews: PreviewProvider {
    static var previews: some View {
        BirthDateView(user: User.base)
            .preferredColorScheme(.dark)
    }
}

extension BirthDateView {
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
    
    private var createBirthDate: some View {
        VStack {
            welcomeMessage
            welcomeTitle
            welcomeSubtitle
            birthDateTextfield
            errorMessage
            Spacer()
            continueButton
        }
        .keyboardType(.decimalPad)
    }
    
    private var welcomeMessage: some View {
        Text("ARE YOU OLD ENOUGH?")
            .font(.system(size: 12))
            .foregroundColor(.secondary)
    }
    
    private var welcomeTitle: some View {
        Text("What is your age?")
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
    
    private var birthDateTextfield: some View {
        HStack(spacing: 5) {
            dayField
            monthField
            yearField
        }
        .multilineTextAlignment(.center)
        .font(.system(size: 28, weight: .bold))
        .onAppear {
            focusedField = .day
        }
    }
    
    private var dayField: some View {
        CustomTextfield(text: $birthDay.day, placeholder: "DD", textfieldState: .twoNumbers)
            .focused($focusedField, equals: .day)
            .onChange(of: birthDay.day) { newValue in
                if newValue.count == 2 {
                    focusedField = .month
                }
                activeButton()
            }
    }
    
    private var monthField: some View {
        CustomTextfield(text: $birthDay.month, placeholder: "MM", textfieldState: .twoNumbers)
            .focused($focusedField, equals: .month)
            .onChange(of: birthDay.month) { newValue in
                if newValue.count == 2 {
                    focusedField = .year
                }
                if newValue.isEmpty {
                    focusedField = .day
                }
                activeButton()
            }
    }
    
    private var yearField: some View {
        CustomTextfield(text: $birthDay.year, placeholder: "YYYY", textfieldState: .fourNumbers)
            .focused($focusedField, equals: .year)
            .onChange(of: birthDay.year) { newValue in
                if newValue.isEmpty {
                    focusedField = .month
                }
                activeButton()
            }
    }
    
    private var continueButton: some View {
        NavigationLink {
            PasswordCreator(viewModel: AccountCreatorViewModel(user: user))
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
            .disabled(isContinueButtonEnabled)
            .opacity(isContinueButtonEnabled ? 1 : 0.4)
        }
    }
    
    private var errorMessage: some View {
        ZStack {
            if isDateErrorTextEnabled {
                Text("Date is invalid")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            }
        }
    }
    
    private func activeButton() {
        isContinueButtonEnabled = birthDay.validate()
        if !isContinueButtonEnabled { isDateErrorTextEnabled = birthDay.isAllFieldsFilled() }
    }
}
