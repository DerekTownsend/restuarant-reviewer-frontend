//
//  Rating.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 5/6/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import Foundation
class Rating: Codable {
    var id, amount, restaurant_id, user_id :Int
    
    init(id :Int, amount :Int, restaurant_id:Int, user_id :Int) {
        self.id = id
        self.amount = amount
        self.user_id = user_id
        self.restaurant_id = restaurant_id
    }
    
}
