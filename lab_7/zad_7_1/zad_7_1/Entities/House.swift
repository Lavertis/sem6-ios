//
//  House.swift
//  zad_7_1
//
//  Created by Rafał Kuźmiczuk on 04/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import Foundation

class House {
    var name: String
    var houseArea: Double
    var roomCount: Int
    var floorCount: Int
    var landArea: Double
    var photoPath: String
    
    internal init(name: String, houseArea: Double, roomCount: Int, floorCount: Int, landArea: Double, photoPath: String) {
        self.name = name
        self.houseArea = houseArea
        self.roomCount = roomCount
        self.floorCount = floorCount
        self.landArea = landArea
        self.photoPath = photoPath
    }
}
