//
//  DataManager.swift
//  Foodie
//
//  Created by Sachin Raut on 25/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation


class DataManager
{
    func load(file name:String) -> [[String:AnyObject]]
    {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let items = NSArray(contentsOfFile: path) else { return [[:]] }
        
        return items as! [[String : AnyObject]]
    }
}

