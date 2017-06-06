//
//  FilterManager.swift
//  Foodie
//
//  Created by Sachin Raut on 25/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

class FilterManager: DataManager
{
    private var items:[FilterItem]=[]
    
    func fetch()
    {
        for data in load(file: "FilterData")
        {
            items.append(FilterItem(dict: data))
        }
    }
    
    func numberOfItems()-> Int
    {
        return items.count
    }
    
    func filterItemAtIndexPath(index: IndexPath)-> FilterItem
    {
        return items[index.item]
    }
    
}
