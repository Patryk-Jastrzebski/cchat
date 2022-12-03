//
//  TransitionAnimation+Extension.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 14/11/2022.
//

import SwiftUI

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))
    }
    
    static var none: AnyTransition {
        AnyTransition.opacity
    }
}
