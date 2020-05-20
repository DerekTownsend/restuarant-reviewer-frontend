//
//  Review.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 5/3/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import Foundation

class Review: Codable {
    var id, user_id, restaurant_id :Int
    var title, message :String
    
    init(id :Int, title :String, message :String, restaurant_id:Int, user_id :Int) {
        self.id = id
        self.title = title
        self.message = message
        self.user_id = user_id
        self.restaurant_id = restaurant_id


    }
    
    
}
