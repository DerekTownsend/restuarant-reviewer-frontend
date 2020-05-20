//
//  ReviewTableViewCell.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 5/3/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var message: UILabel!
    
   func setReview(review: Review) {
        title.text = review.title
        message.text = review.message
    }

}
