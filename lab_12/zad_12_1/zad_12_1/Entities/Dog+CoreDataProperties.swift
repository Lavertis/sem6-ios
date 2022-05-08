//
//  Dog+CoreDataProperties.swift
//  zad_12_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog")
    }

    @NSManaged public var birthYear: Int16
    @NSManaged public var name: String?
    @NSManaged public var breed: Breed?

}
