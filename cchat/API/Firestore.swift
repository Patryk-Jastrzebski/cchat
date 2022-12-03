//
//  Firestore.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 13/11/2022.
//

import Foundation
import Firebase

final class API {
    static let db = Firestore.firestore()
    static let auth = Auth.auth()
}
