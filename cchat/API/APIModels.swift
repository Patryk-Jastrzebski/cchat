//
//  APIModels.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 13/11/2022.
//

import Foundation

enum APIModel: String {
    case users
}

extension APIModel {
    var getRef: String {
        return self.rawValue
    }
}
