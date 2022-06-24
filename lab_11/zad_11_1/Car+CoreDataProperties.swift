//
//  Car+CoreDataProperties.swift
//  zad_11_1
//
//  Created by Rafał Kuźmiczuk on 24/06/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Car: Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }
    
    @NSManaged public var brand: String?
    @NSManaged public var mileage: Int32
    @NSManaged public var model: String?
    @NSManaged public var price: Double
    @NSManaged public var productionYear: Int16
    
}
