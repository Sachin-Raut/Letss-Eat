//
//  ReviewDataManager.swift
//  Foodie
//
//  Created by Sachin Raut on 27/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit

class ReviewDataManager: NSObject
{
    private var items: [ReviewItem]=[]
    
    let manager = CoreDataManager()
    
    func fetchReview(by id: Int)
    {
        if items.count > 0
        {
            items.removeAll()
        }
        
        for data in manager.fetchReviews(by: id)
        {
            items.append(data)
        }
    }
    
    func numberOfItems()-> Int
    {
        return items.count
    }
    
    func reviewItem(at index: IndexPath)-> ReviewItem
    {
        return items[index.item]
    }
    
    
    func getLatestReview()-> ReviewItem
    {
        guard let item = items.first
        else
        {
            return ReviewItem()
        }
        return item
    }
    
}
