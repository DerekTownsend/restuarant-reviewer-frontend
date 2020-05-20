//
//  AddReviewViewController.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/30/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit

class AddReviewViewController: UIViewController {
    @IBOutlet weak var reviewTitle: UITextField!
    @IBOutlet weak var message: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        message.layer.borderWidth = 0.5
        message.layer.borderColor = borderColor.cgColor
        message.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
        let toolBar = UIToolbar();
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([doneButton], animated: false)
        
        reviewTitle.inputAccessoryView = toolBar
        message.inputAccessoryView = toolBar
    }
    
    @IBAction func addReview(_ sender: Any) {
        let review = Review(id: 0, title: reviewTitle.text!, message: message.text!, restaurant_id: 1, user_id: 1)
        let postRequest = APIRequest(endpoint: "reviews")
        postRequest.saveReview(review,completion: {result in
            switch result {
            case .success(let review):
                print("The following has be sent")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "unwindAddReview", sender: review)
                }
            case .failure(let error):
                print("ERROR")
            }
        })
    }
    //    @IBAction func addReview(_ sender: Any) {
//         self.performSegue(withIdentifier: "unwindAddReview", sender: self)
//    }
    func loadNextScreen(data: Review) {
        self.performSegue(withIdentifier: "unwindAddReview", sender: data)
    }
    
    @objc func doneClicked() {
        
        view.endEditing(true)
    }


}
