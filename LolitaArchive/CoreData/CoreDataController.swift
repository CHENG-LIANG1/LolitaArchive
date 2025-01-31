//
//  CoreDataController.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//
import CoreData
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ArchiveModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
