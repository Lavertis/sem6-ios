//
//  Breed+CoreDataProperties.swift
//  zad_12_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Breed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Breed> {
        return NSFetchRequest<Breed>(entityName: "Breed")
    }

    @NSManaged public var name: String?
    @NSManaged public var dog: NSSet?
    
    public var dogArray: [Dog] {
        let set = dog as? Set<Dog> ?? []
        return set.sorted { $0.name! < $1.name! }
    }

}

// MARK: Generated accessors for dog
extension Breed {

    @objc(addDogObject:)
    @NSManaged public func addToDog(_ value: Dog)

    @objc(removeDogObject:)
    @NSManaged public func removeFromDog(_ value: Dog)

    @objc(addDog:)
    @NSManaged public func addToDog(_ values: NSSet)

    @objc(removeDog:)
    @NSManaged public func removeFromDog(_ values: NSSet)

}
