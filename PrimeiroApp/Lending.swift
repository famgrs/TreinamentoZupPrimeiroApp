//
//  Lending.swift
//  PrimeiroApp
//
//  Created by Anderson Oliveira on 09/05/19.
//  Copyright © 2019 andersonOliveira. All rights reserved.
//

import Foundation

struct Lending: Codable, Comparable, Hashable {
    var name: String
    var object: String
    var date: Date
    
    static func < (lhs: Lending, rhs: Lending) -> Bool {
        return lhs.date < rhs.date
    }
}
