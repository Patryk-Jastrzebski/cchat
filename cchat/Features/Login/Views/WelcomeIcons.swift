//
//  WelcomeIcons.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//

// swiftlint: disable all
import SwiftUI

struct WelcomeIcons: View {
    var body: some View {
        VStack(spacing: 10) {
            appName
            Spacer()
            icon
            welcomeText
            rectanglesTop
            rectanglesBottom
            Spacer()
        }
    }
}

struct WelcomeIcons_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeIcons()
    }
}

extension WelcomeIcons {
    private var appName: some View {
        Text(Strings.App.name)
            .font(.system(size: 28))
            .fontWeight(.bold)
    }
    private var icon: some View {
        Image(systemName: "person")
            .font(.system(size: 36))
            .padding()
            .background(.orange)
            .cornerRadius(15)
    }
    
    private var welcomeText: some View {
        Text(Strings.Welcome.text)
            .font(.system(size: 36))
            .fontWeight(.bold)
            .padding(.vertical, 20)
            .multilineTextAlignment(.center)
    }
    
    private var rectanglesTop: some View {
        HStack {
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 100, height: 10)
                .cornerRadius(5)
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 70, height: 10)
                .cornerRadius(5)
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 120, height: 10)
                .cornerRadius(5)
        }
    }
    
    private var rectanglesBottom: some View {
        HStack {
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 50, height: 10)
                .cornerRadius(5)
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 70, height: 10)
                .cornerRadius(5)
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 30, height: 10)
                .cornerRadius(5)
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 60, height: 10)
                .cornerRadius(5)
        }
    }
}
