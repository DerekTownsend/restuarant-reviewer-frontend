//
//  AddRestaurantViewController.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/30/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit

class AddRestaurantViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var thumbnail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        bio.layer.borderWidth = 0.5
        bio.layer.borderColor = borderColor.cgColor
        bio.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
        let toolBar = UIToolbar();
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([doneButton], animated: false)
        
        name.inputAccessoryView = toolBar
        address.inputAccessoryView = toolBar
        thumbnail.inputAccessoryView = toolBar
        bio.inputAccessoryView = toolBar    }
    

    @IBAction func addRestaurant(_ sender: Any) {
        let restaurant = Restaurant(id: 0, name: name.text!, bio: bio.text, address: address.text!, city: "", zipcode: "", thumbnail: thumbnail.text!, rating: 0, user_id: 1, favorited: false)

        let postRequest = APIRequest(endpoint: "restaurants")
        postRequest.saveRestaurant(restaurant,completion: {result in
            switch result {
            case .success(let restaurant):
                print("The following has be sent")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "unwindAddRestaurant", sender: restaurant)
                }
            case .failure(let error):
                print("ERROR")
            }
        })
    }

        //    @IBAction func addReview(_ sender: Any) {
    //         self.performSegue(withIdentifier: "unwindAddReview", sender: self)
    //    }
        func loadNextScreen(data: Restaurant) {
            self.performSegue(withIdentifier: "unwindAddRestaurant", sender: data)
        }
        
        @objc func doneClicked() {
            
            view.endEditing(true)
        }
}
