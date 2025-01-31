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
    @NSManaged public var images: NSSet?

}

// MARK: Generated accessors for images
extension LolitaProduct {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: LolitaImage)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: LolitaImage)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}

extension LolitaProduct : Identifiable {

}
