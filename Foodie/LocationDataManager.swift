//
//  LocationDataManager.swift
//  Foodie
//
//  Created by Sachin Raut on 21/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

class LocationDataManager
{
    private var locations: [String]=[]
    
    private func loadData()-> [String]
    {
        guard let path = Bundle.main.path(forResource: "locations", ofType: "plist"), let items = NSArray(contentsOfFile: path)
        else
        {
            return []
        }
        return items as! [String]
    }
    
    func fetch()
    {
        for location in loadData()
        {
            locations.append(location)
        }
    }
    
    func numberOfItems()-> Int
    {
        return locations.count
    }
    
    func locationItem(at index: IndexPath)-> String
    {
        return locations[index.item]
    }
    
    func findLocation(by name: String)-> (isFound: Bool, position: Int)
    {
        guard let index = locations.index(of: name)
        else
        {
            return (isFound: false, position: 0)
        }
        return (isFound: true, position: index)
    }
    
}
