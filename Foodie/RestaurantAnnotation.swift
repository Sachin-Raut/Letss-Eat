//
//  RestaurantAnnotation.swift
//  Foodie
//
//  Created by Sachin Raut on 22/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit
import MapKit

class RestaurantAnnotation: NSObject, MKAnnotation
{
    var name: String?
    var cuisines: [String]=[]
    var latitude: Double?
    var longitude: Double?
    var address: String?
    var postalCode: String?
    var state: String?
    var imageURL: String?
    
    var data: [String: AnyObject]?
    
    
    init(dict:[String: AnyObject])
    {
        if let lat = dict["lat"] as? Double
        {
            self.latitude = lat
        }
        
        if let long = dict["lng"] as? Double
        {
            self.longitude = long
        }
        
        if let name = dict["name"] as? String
        {
            self.name = name
        }
        
        if let cuisines = dict["cuisines"] as? [AnyObject]
        {
            for data in cuisines
            {
                if let cuisine = data["cuisine"] as? String
                {
                    self.cuisines.append(cuisine)
                }
            }
        }
        
        if let address = dict["address"] as? String
        {
            self.address = address
        }
        
        if let postalCode = dict["postal_code"] as? String
        {
            self.postalCode = postalCode
        }
        
        if let state = dict["state"] as? String
        {
            self.state = state
        }
        
        if let image = dict["image_url"] as? String
        {
            self.imageURL = image
        }
        
        data = dict
        
    }
    
    var restaurantItem: RestaurantItem
    {
        guard let restaurantData = data
        else
        {
            return RestaurantItem()
        }
        return RestaurantItem(dict: restaurantData)
    }
    
    var coordinate: CLLocationCoordinate2D
    {
        guard let lat = latitude, let long = longitude
        else
        {
            return CLLocationCoordinate2D()
        }
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    var subtitle: String?
    {
        if cuisines.isEmpty
        {
            return ""
        }
        else if cuisines.count == 1
        {
            return cuisines.first
        }
        else
        {
            return cuisines.joined(separator: ",")
        }
    }
    
    var title: String?
    {
        return name
    }
}
