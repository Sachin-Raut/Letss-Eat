//
//  ExploreDataManager.swift
//  Foodie
//
//  Created by Sachin Raut on 21/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

class ExploreDataManager
{
    fileprivate var items: [ExploreItem]=[]
    
    fileprivate func loadData()-> [[String: AnyObject]]
    {
        guard let path = Bundle.main.path(forResource: "ExploreData", ofType: "plist"), let items = NSArray(contentsOfFile: path)
        else
        {
            return [[:]]
        }
        return items as! [[String: AnyObject]]
    }
    
    func fetch()
    {
        for data in loadData()
        {
            items.append(ExploreItem(dict: data))
        }
    }
    
    
    func explore(at index: IndexPath)-> ExploreItem
    {
        return items[index.item]
    }
    
    func numberOfItems()-> Int
    {
        return items.count
    }
}

