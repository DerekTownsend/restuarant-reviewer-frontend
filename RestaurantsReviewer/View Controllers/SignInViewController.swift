//
//  SignInViewController.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/29/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func signInButton(_ sender: UIButton) {
//        var myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "restTabBar") as! UITabBarController
//        
//         var appDelegate = UIApplication.shared.delegate! as! AppDelegate
//        
//        appDelegate.window.rootViewController = myTabBar
//        appDelegate.window.makeKeyAndVisible()
        transitionToHome()
        
    }
    func transitionToHome() {
        var myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "restTabBar") as! UITabBarController
        view.window?.rootViewController = myTabBar
        view.window?.makeKeyAndVisible()

    }
    
    @IBAction func unwindRegister (_ sender: UIStoryboardSegue){
//        unfilteredCourseList =  unfilteredCourseList.sorted(by: sortCourses)
//        filteredCourses = unfilteredCourseList
//        self.tableView.reloadData()
    }
    
        @IBAction func unwindLogout (_ sender: UIStoryboardSegue){
    //        unfilteredCourseList =  unfilteredCourseList.sorted(by: sortCourses)
    //        filteredCourses = unfilteredCourseList
    //        self.tableView.reloadData()
        }

}
