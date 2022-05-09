//
//  BookGenre+CoreDataProperties.swift
//  zad_12_1
//
//  Created by Rafał Kuźmiczuk on 09/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//
//

import Foundation
import CoreData


extension BookGenre {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookGenre> {
        return NSFetchRequest<BookGenre>(entityName: "BookGenre")
    }

    @NSManaged public var name: String?
    @NSManaged public var book: NSSet?

    public var books: [Book] {
        let set = book as? Set<Book> ?? []
        return set.sorted { $0.title! < $1.title! }
    }
}

// MARK: Generated accessors for book
extension BookGenre {

    @objc(addBookObject:)
    @NSManaged public func addToBook(_ value: Book)

    @objc(removeBookObject:)
    @NSManaged public func removeFromBook(_ value: Book)

    @objc(addBook:)
    @NSManaged public func addToBook(_ values: NSSet)

    @objc(removeBook:)
    @NSManaged public func removeFromBook(_ values: NSSet)

}
