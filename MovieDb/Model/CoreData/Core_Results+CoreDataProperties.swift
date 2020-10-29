//
//  Core_Results+CoreDataProperties.swift
//  MovieDb
//
//  Created by Jonathan Ng on 28/10/2020.
//
//

import Foundation
import CoreData


extension Core_Results {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Core_Results> {
        return NSFetchRequest<Core_Results>(entityName: "Core_Results")
    }

    @NSManaged public var id: Int64
    @NSManaged public var img: String?
    @NSManaged public var language: String?
    @NSManaged public var overview: String?
    @NSManaged public var release_date: Date?
    @NSManaged public var title: String?
    @NSManaged public var vote_average: Double

}

extension Core_Results : Identifiable {

}
