//
//  View+Extension.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 30/11/2022.
//

import SwiftUI

extension View {
    func limitText(_ text: Binding<String>, to characterLimit: Int) -> some View {
        self
            .onChange(of: text.wrappedValue) { _ in
                text.wrappedValue = String(text.wrappedValue.prefix(characterLimit))
            }
    }
}
