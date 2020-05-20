//
//  RestaurantsAllTableViewController.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 4/30/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import UIKit
var restaurants = [Restaurant.init(id: 1, name: "Test", bio: "Big Test COming us", address: "1111 Sout vernon ave, Detroit 66616", city: "Detroit", zipcode: "66616", thumbnail: "https://b.zmtcdn.com/data/res_imagery/16752778_RESTAURANT_d9be527aa23dd6f05e1b0d51a3296ded_c.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A", rating: 88, user_id: 1, favorited: false),]

var myIndex = 0;
//restaurants?.append()

class RestaurantsAllTableViewController: UITableViewController {
//    @IBOutlet weak var name: UILabel!
//    @IBOutlet weak var address: UILabel!
//    @IBOutlet weak var rating: UILabel!
//    @IBOutlet weak var thumbnail: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//            let managedContext = appDelegate.persistentContainer.viewContext
//            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Courser")
//            do{
//                unfilteredNSCourseList = try managedContext.fetch(fetchRequest)
//            } catch let error as NSError{
//                print("Could not fetch. \(error) \(error.userInfo)")
//            }
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return restaurants.count
            
        }

         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let restaurant = restaurants[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)as! RestaurantTableViewCell
            cell.setResturant(restaurant: restaurant)
            return cell

           }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            myIndex = indexPath.row
            
    //        performSegue(withIdentifier: "segue", sender: self)
        }
        @IBAction func unwindAddRestaurant (_ sender: UIStoryboardSegue){
//            unfilteredCourseList =  unfilteredCourseList.sorted(by: sortCourses)
//            filteredCourses = unfilteredCourseList
            self.tableView.reloadData()
        }
    func getRestuarants() {
        
    }
//        func save(name: String, courseNumber: Int, courseDescription: String, creditHours: Int, prerequisites: String) {
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return  }
//            let managedContext = appDelegate.persistentContainer.viewContext
//
//            let entity = NSEntityDescription.entity(forEntityName: "Courser", in: managedContext)!
//
//            let course = NSManagedObject(entity: entity, insertInto: managedContext)
//
//            course.setValue(name, forKey: "name")
//            course.setValue(courseNumber, forKey: "courseNumber")
//            course.setValue(courseDescription, forKey: "courseDescription")
//            course.setValue(creditHours, forKey: "creditHours")
//            course.setValue(prerequisites, forKey: "prerequisites")
//            course.setValue(0, forKey: "views")
//            course.setValue(false, forKey: "favorited")
//
//
//            do {
//                try managedContext.save()
//                unfilteredNSCourseList.append(course)
//            } catch let error as NSError {
//                print("Could not save. \(error), \(error.userInfo)")
//            }
//        }
//        func deleteAll () {
//
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//                    return
//            }
//
//            let managedContext = appDelegate.persistentContainer.viewContext
//
//            // Create Fetch Request
//            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Courser")
//
//            // Create Batch Delete Request
//            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
//
//            do {
//                try managedContext.execute(batchDeleteRequest)
//            } catch {
//                // Error Handling
//            }
//        }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

