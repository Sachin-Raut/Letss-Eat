//
//  MapDataManager.swift
//  Foodie
//
//  Created by Sachin Raut on 22/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation
import MapKit

class MapDataManager
{
    fileprivate var items: [RestaurantAnnotation]=[]
    
        
    var annotations: [RestaurantAnnotation]
    {
        return items
    }
    
    func fetch(completion: (_ annotations: [RestaurantAnnotation])-> ())
    {
        if items.count > 0
        {
            items.removeAll()
        }
        //for data in loadData()
        
        
        if location == ""
        {
            location = "Chicago"
        }
        
        
        for data in RestaurantAPIManager.loadJSON(file: location)
        {
            items.append(RestaurantAnnotation(dict: data))
        }
        completion(items)
    }
    
    fileprivate func loadData()-> [[String: AnyObject]]
    {
        guard let path = Bundle.main.path(forResource: "MapLocations", ofType: "plist"), let items = NSArray(contentsOfFile: path)
        else
        {
            return [[:]]
        }
        
        return items as! [[String: AnyObject]]
    }
    
    func currentRegion(latDelta:CLLocationDegrees, longDelta: CLLocationDegrees)-> MKCoordinateRegion
    {
        guard let item = items.first
        else
        {
            return MKCoordinateRegion()
        }
        
        let span = MKCoordinateSpanMake(latDelta, longDelta)
        
        return MKCoordinateRegion(center: item.coordinate, span: span)
    }
    
}
