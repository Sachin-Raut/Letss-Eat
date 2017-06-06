//
//  CoreDataManager.swift
//  Foodie
//
//  Created by Sachin Raut on 26/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject
{
    let container: NSPersistentContainer
    
    override init()
    {
        container = NSPersistentContainer(name: "LetsEatModel")
        
        container.loadPersistentStores { (desc, error) in
            
            if error != nil
            {
                return
            }
        }
    }
    
    
    func addReview(_ item: ReviewItem)
    {
        let review = Review(context: container.viewContext)
        
        review.name = item.name
        review.date = NSDate()
        
        if let rating = item.rating
        {
            review.rating = rating
        }
        
        review.customerReview = item.customerReview
        review.photo = item.photoData
        review.uuid = item.uuid
        
        if let id = item.restaurantID
        {
            review.restaurantID = Int32(id)
            print("Restaurant Id = \(id)")
            save()
        }
        
    }
    
    fileprivate func save()
    {
        do
        {
            if container.viewContext.hasChanges
            {
                try container.viewContext.save()
            }
        }
        catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    func fetchReviews(by identifier: Int)-> [ReviewItem]
    {
        let moc = container.viewContext
        
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        
        
        let predicate = NSPredicate(format: "restaurantID = %i", Int32(identifier))
        
        var items: [ReviewItem]=[]
        
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        request.predicate = predicate
        
        do
        {
            for data in try moc.fetch(request)
            {
                items.append(ReviewItem(data: data))
            }
            return items
        }
        catch
        {
            fatalError("Failed to fetch reviews - \(error)")
        }
    }
    
}









