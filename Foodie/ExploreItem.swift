//
//  ExploreItem.swift
//  Foodie
//
//  Created by Sachin Raut on 21/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

struct ExploreItem
{
    var name: String?
    var image: String?
}

extension ExploreItem
{
    init(dict: [String: AnyObject])
    {
        self.name = dict["name"] as? String
        self.image = dict["image"] as? String
    }
}
