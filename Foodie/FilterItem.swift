//
//  FilterItem.swift
//  Foodie
//
//  Created by Sachin Raut on 25/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

struct FilterItem
{
    var filter: String?
    var name: String?
}

extension FilterItem
{
    init(dict:[String: AnyObject])
    {
        name = dict["name"] as? String
        filter = dict["filter"] as? String
    }
}
