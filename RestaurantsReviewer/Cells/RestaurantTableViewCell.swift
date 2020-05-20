//
//  RestaurantTableViewCell.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/30/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    func setResturant(restaurant: Restaurant) {
        let url =  URL(string: restaurant.thumbnail)
        name.text = restaurant.name
        thumbnail.load(url: url!)
        print(restaurant.address)
        address.text = restaurant.address
        rating.text = "\(restaurant.rating)%"
    }

}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
