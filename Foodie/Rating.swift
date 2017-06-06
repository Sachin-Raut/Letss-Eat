//
//  Rating.swift
//  Foodie
//
//  Created by Sachin Raut on 27/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

enum Rating
{
    case zero
    case half
    case one
    case oneHalf
    case two
    case twoHalf
    case three
    case threeHalf
    case four
    case fourHalf
    case five
    
    
    
    var value: Float
    {
        switch self
        {
        case .zero:
            return Float(0.0)
        case .half:
            return Float(0.5)
        case .one:
            return Float(1.0)
        case .oneHalf:
            return Float(1.5)
        case .two:
            return Float(2.0)
        case .twoHalf:
            return Float(2.5)
        case .three:
            return Float(3.0)
        case .threeHalf:
            return Float(3.5)
        case .four:
            return Float(4.0)
        case .fourHalf:
            return Float(4.5)
        case .five:
            return Float(5.0)
        }
    }
    
    static func image(rating: Float)-> String
    {
        var images = ["0star","05star","1star","15star","2star","25star","3star","35star","4star","45star","5star"]
        
        var values: [Float]=[]
        
        for i in stride(from: 0, through: 5.0, by: 0.5)
        {
            values.append(Float(i))
        }
        
        guard let index = values.index(of: rating)
        else
        {
            return ""
        }
        return images[index]
    }
}
