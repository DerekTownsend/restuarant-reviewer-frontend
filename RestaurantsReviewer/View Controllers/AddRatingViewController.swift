//
//  AddRatingViewController.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 5/6/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit

class AddRatingViewController: UIViewController {

    @IBOutlet weak var ratingAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addRatingBtn(_ sender: Any) {
        let rating = Rating(id: 0, amount: Int(ratingAmount.text!)!, restaurant_id: 1, user_id: 1)
                let postRequest = APIRequest(endpoint: "ratings")
                postRequest.saveRating(rating,completion: {result in
                    switch result {
                    case .success(let rating):
                        print("The following has be sent")
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "unwindAddRating", sender: rating)
                        }
                    case .failure(let error):
                        print("ERROR")
                    }
                })
            }
    
        //    @IBAction func addReview(_ sender: Any) {
        //         self.performSegue(withIdentifier: "unwindAddReview", sender: self)
        //    }

        func loadNextScreen(data: Rating) {
            self.performSegue(withIdentifier: "unwindAddReview", sender: data)
        }

}
