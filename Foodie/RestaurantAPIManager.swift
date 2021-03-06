//
//  RestaurantAPIManager.swift
//  Foodie
//
//  Created by Sachin Raut on 24/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

struct RestaurantAPIManager
{
    static func loadJSON(file name: String)-> [[String: AnyObject]]
    {
        var items = [[String: AnyObject]]()
        
        guard let path = Bundle.main.path(forResource: name, ofType: "json"), let data = NSData(contentsOfFile: path)
        else
        {
            return [[:]]
        }
        
        do
        {
            let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as AnyObject
            
            if let restaurants = json["restaurants"] as? [[String: AnyObject]]
            {
                items = restaurants as [[String: AnyObject]]
            }
        }
        catch
        {
            print("error serialising JSON - \(error)")
            items = [[:]]
        }
        
        return items
    }
    
}
