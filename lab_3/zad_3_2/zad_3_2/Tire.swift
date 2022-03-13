//
//  Tire.swift
//  zad_3_2
//
//  Created by Rafał Kuźmiczuk on 13/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import Foundation

struct Tire {
    var manufacturer: String
    var sizeAvailability: [Int:Int]
    
    init(manufacturer: String, sizeAvailability: [Int:Int]) {
        self.manufacturer = manufacturer
        self.sizeAvailability = sizeAvailability
    }
}
