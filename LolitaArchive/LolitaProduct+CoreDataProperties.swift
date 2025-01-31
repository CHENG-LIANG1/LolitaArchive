//
//  LolitaProduct+CoreDataProperties.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//
//

import Foundation
import CoreData


extension LolitaProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LolitaProduct> {
        return NSFetchRequest<LolitaProduct>(entityName: "LolitaProduct")
    }

    @NSManaged public var brand: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var productimage: Data?
    @NSManaged public var size: String?
    @NSManaged public var tags: String?
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension LolitaProduct {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: LolitaImage)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: LolitaImage)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}

extension LolitaProduct : Identifiable {

}
