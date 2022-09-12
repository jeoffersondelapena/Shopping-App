//
//  Double+Extensions.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import Foundation

extension Double {
    
    func toDollarFormatString() -> String {
        return String(format: "$%.02f", self)
    }
}
