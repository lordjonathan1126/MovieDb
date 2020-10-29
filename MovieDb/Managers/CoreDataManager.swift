//
//  CoreDataManager.swift
//  MovieDb-fave
//
//  Created by Jonathan Ng on 28/10/2020.
//

import UIKit
import CoreData

class CoreDataManager : NSObject{
    public static let sharedInstance = CoreDataManager()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override init() {}
    
    func saveResults(_ results: [Results]){
        let context = self.appDelegate!.persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        
        for result in results{
            let newResult = NSEntityDescription.insertNewObject(forEntityName: "Core_Results", into: context)
            newResult.setValue(result.id, forKey: "id")
            newResult.setValue(result.title, forKey: "title")
            newResult.setValue(result.poster_path, forKey:"img")
            newResult.setValue(result.vote_average, forKey:"vote_average")
            newResult.setValue(result.release_date, forKey: "release_date")
            newResult.setValue(result.original_language, forKey:"language")
            newResult.setValue(result.overview, forKey: "overview")
        }
        do {
            try context.save()
            print("Saved Post to Core Data")
        } catch {
            print("Error saving: \(error) \(error.localizedDescription)")
        }
    }
}

