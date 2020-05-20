//
//  DetailedRestaurantViewController.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/30/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit
var reviews = [Review.init(id: 1, title: "Good place", message: "Big BOI ENERGY", restaurant_id: 1, user_id: 1),Review.init(id: 2, title: "Gooder place", message: "Big BOI ENERGY", restaurant_id: 1, user_id: 1),Review.init(id: 3, title: "Goodest place", message: "Big BOI ENERGY", restaurant_id: 1, user_id: 1)]

class DetailedRestaurantViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!

    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentRestaurant = restaurants[myIndex]
        let url =  URL(string: currentRestaurant.thumbnail)
        name.text = currentRestaurant.name
        address.text = currentRestaurant.address
        rating.text = "\(currentRestaurant.rating)%"
        bio.text = currentRestaurant.bio
        thumbnail.load(url: url!)
        tableview.dataSource = self

        
    }
    
    @IBAction func unwindAddReview (_ sender: UIStoryboardSegue){
    //        unfilteredCourseList =  unfilteredCourseList.sorted(by: sortCourses)
    //        filteredCourses = unfilteredCourseList
    //        self.tableView.reloadData()
        }
    @IBAction func unwindAddRating (_ sender: UIStoryboardSegue){
    //        unfilteredCourseList =  unfilteredCourseList.sorted(by: sortCourses)
    //        filteredCourses = unfilteredCourseList
    //        self.tableView.reloadData()
        }
}
extension DetailedRestaurantViewController: UITableViewDataSource{
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return reviews.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let review = reviews[indexPath.row]
       let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)as! ReviewTableViewCell
       cell.setReview(review: review)
       return cell

      }
}
