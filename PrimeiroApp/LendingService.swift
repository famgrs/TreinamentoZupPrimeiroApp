//
//  File.swift
//  PrimeiroApp
//
//  Created by Anderson Oliveira on 10/05/19.
//  Copyright © 2019 andersonOliveira. All rights reserved.
//

import Foundation

class LendingService {
    
    static let shared = LendingService()
    
    var lendings: [Lending] {
        get {
            return lendingss() ?? []
        }
        set {
            set(lendings: newValue)
        }
    }
    
    private func set(lendings: [Lending]) {
        let data = try? JSONEncoder().encode(lendings)
        UserDefaults.standard.set(data, forKey: "lendingKey")
    }
    
    private func lendingss() -> [Lending]? {
        guard let jsonData = UserDefaults.standard.object(forKey: "lendingKey") as? Data,
            let lendings = try? JSONDecoder().decode([Lending].self, from: jsonData)
            else { return nil }
        return lendings
    }
}
