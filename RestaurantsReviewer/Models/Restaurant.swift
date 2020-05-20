//
//  Restaurant.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/30/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import Foundation
class Restaurant: Codable {
    var id, user_id, rating :Int
    var name, bio, address, city, zipcode, thumbnail :String
    var favorited :Bool

    
    init(id :Int, name :String, bio :String, address :String, city :String, zipcode :String, thumbnail :String, rating:Int, user_id :Int, favorited :Bool = false ) {
        self.id = id
        self.bio = bio
        self.address = address
        self.city = city
        self.name = name
        self.city = city
        self.zipcode = zipcode
        self.thumbnail = thumbnail
        self.rating = rating
        self.user_id = user_id
        self.favorited = favorited


    }
    
    
}
