//
//  TiresManager.swift
//  zad_3_2
//
//  Created by Rafał Kuźmiczuk on 13/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import Foundation

struct TiresManager {
    var tires: [Tire]
    
    init() {
        self.tires = [
            Tire(manufacturer: "Continental", sizeAvailability: [16:5, 17:3, 18:10]),
            Tire(manufacturer: "Bridgestone", sizeAvailability: [16:12, 17:5, 18:8]),
            Tire(manufacturer: "Dunlop", sizeAvailability: [15:30, 16:15, 17:2]),
        ]
    }
    
    func checkAvailability(manufacturer: String, size: Int, quantity: Int) -> Bool {
        guard let m = (tires.first{ tire in tire.manufacturer == manufacturer}) else {
            return false
        }
        guard let a = m.sizeAvailability[size] else {
            return false
        }
        guard a >= quantity else {
            return false
        }
        
        return true
    }
    
    func getAllSizes() -> [Int] {
        var sizes: Set<Int> = Set()
        for tire in tires {
            for size in tire.sizeAvailability.keys {
                sizes.insert(size)
            }
        }
        
        return Array(sizes).sorted()
    }
    
    func getAllManufacturers() -> [String] {
        var manufacturers: Set<String> = Set()
        for tire in tires {
            manufacturers.insert(tire.manufacturer)
        }
        
        return Array(manufacturers).sorted()
    }
}
