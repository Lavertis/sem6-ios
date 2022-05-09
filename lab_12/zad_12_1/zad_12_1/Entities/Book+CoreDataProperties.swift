//
//  Book+CoreDataProperties.swift
//  zad_12_1
//
//  Created by Rafał Kuźmiczuk on 09/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var title: String?
    @NSManaged public var publishYear: Int16
    @NSManaged public var publisher: String?
    @NSManaged public var stars: Int16
    @NSManaged public var genre: BookGenre?

}
