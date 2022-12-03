//
//  CustomTextfield.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

import SwiftUI

struct CustomTextfield: View {
    @Binding var text: String
    @State var placeholder: String
    @State var textfieldState: TextFieldType
    
    var body: some View {
        switch textfieldState {
        case .notsecure:
            textfield
        case .secure:
            securefield
        case .twoNumbers:
            twoNumbers
        case .fourNumbers:
            fourNumbers
        }
    }
}

extension CustomTextfield {
    private var twoNumbers: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(.roundedBorder)
            .frame(width: 65)
            .limitText($text, to: 2)
    }
    
    private var fourNumbers: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(.roundedBorder)
            .frame(width: 100)
            .limitText($text, to: 4)
    }
    
    private var textfield: some View {
        TextField(placeholder, text: $text)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .padding(10)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
    
    private var securefield: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)
            .padding(10)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}

enum TextFieldType {
    case notsecure
    case secure
    case twoNumbers
    case fourNumbers
}
