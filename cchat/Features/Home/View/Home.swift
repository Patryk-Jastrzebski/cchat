//
//  Home.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 20/11/2022.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            welcomeUser
            Spacer()
            HStack {
                nextScreen
                logout
            }
        }
        .onAppear {
            viewModel.getUserData()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

extension Home {
    private var welcomeUser: some View {
        Text("Witaj, \(viewModel.user.email)")
            .font(.system(size: 20, weight: .semibold))
    }
    
    private var nextScreen: some View {
        NavigationLink {
           EmptyView()
        } label: {
            Text("Next")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
                .frame(width: 100, height: 45)
                .background(.white)
                .cornerRadius(25)
        }
    }
    
    private var logout: some View {
        Button {
            viewModel.logoutUser()
        } label: {
            Text("Logout")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
                .frame(width: 100, height: 45)
                .background(.white)
                .cornerRadius(25)
        }
    }
}
