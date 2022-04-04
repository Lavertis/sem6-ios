//
//  Flat.swift
//  zad_7_2
//
//  Created by Rafał Kuźmiczuk on 04/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import Foundation

class Flat {
    var name: String
    var area: Double
    var roomCount: Int
    var isDuplex: Bool
    var photoPath: String
    
    internal init(name: String, area: Double, roomCount: Int, isDuplex: Bool, photoPath: String) {
        self.name = name
        self.area = area
        self.roomCount = roomCount
        self.isDuplex = isDuplex
        self.photoPath = photoPath
    }
}
