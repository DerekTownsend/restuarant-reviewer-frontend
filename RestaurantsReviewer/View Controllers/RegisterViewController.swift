//
//  RegisterViewController.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/29/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        transitionToHome() 
    }
    
    func transitionToHome() {
        var myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "restTabBar") as! UITabBarController
        view.window?.rootViewController = myTabBar
        view.window?.makeKeyAndVisible()

    }

}
