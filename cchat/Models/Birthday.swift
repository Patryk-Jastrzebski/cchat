//
//  Birthday.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 22/11/2022.
//

import Foundation

struct Birthday: Equatable {
    static let base = Birthday(day: "", month: "", year: "")
    
    var day: String
    var month: String
    var year: String
    
    func validate() -> Bool {
        guard let day = Int(day) else { return false }
        guard let month = Int(month) else { return false }
        guard let year = Int(year) else { return false }
        
        if isRealDate(day, min: 1, max: 31) && isRealDate(month, min: 1, max: 12) && isRealDate(year, min: 1900, max: 2022) {
            return true
        } else {
            return false
        }
    }
    
    func isAllFieldsFilled() -> Bool {
        day.count == 2 && month.count == 2 && year.count == 4
    }
    
    func isRealDate(_ date: Int, min: Int, max: Int) -> Bool {
        date >= min && date <= max
    }
}
