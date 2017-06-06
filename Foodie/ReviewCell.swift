//
//  ReviewCell.swift
//  Foodie
//
//  Created by Sachin Raut on 28/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell
{

    @IBOutlet var imgRating: UIImageView!
    @IBOutlet var imgReview: UIImageView!
    @IBOutlet var lblUser: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblReview: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
