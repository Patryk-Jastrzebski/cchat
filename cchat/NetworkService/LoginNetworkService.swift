//
//  LoginNetworkService.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 13/11/2022.
//

import Foundation

protocol LoginNetworkService {
    func fetchEmailExist(email: String) async throws -> Bool
}

final class LoginNetworkServiceImpl: LoginNetworkService {
    static let shared = LoginNetworkServiceImpl()
    
    func fetchEmailExist(email: String) async throws-> Bool {
        let email = try await API.db.collection(APIModel.users.getRef).whereField("email", isEqualTo: email).getDocuments()
        return !email.documents.isEmpty
    }
}
