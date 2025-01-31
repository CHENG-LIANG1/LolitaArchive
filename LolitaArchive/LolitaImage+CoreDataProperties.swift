//
//  LolitaImage+CoreDataProperties.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//
//

import Foundation
import CoreData


extension LolitaImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LolitaImage> {
        return NSFetchRequest<LolitaImage>(entityName: "LolitaImage")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imagePath: String?
    @NSManaged public var relationship: LolitaProduct?

}

extension LolitaImage : Identifiable {

}
