//
//  Testing.swift
//  RestaurantsReviewer
//
//  Created by Derek Townsend on 5/6/20.
//  Copyright © 2020 Derek Townsend. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
    case noDataAvailable
    case cannotProcess
}

struct APIRequest {
    let resourceURL: URL
    
    init(endpoint: String) {
        let resourceString = "http://localhost:3000/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func saveReview(_ reviewToSave:Review, completion: @escaping(Result<Review, APIError>) -> Void) {
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(reviewToSave)
            
            let dataTask = URLSession.shared.dataTask(with:urlRequest){data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else{
                    completion(.failure(.responseProblem))
                    return
                }
                do{
                    let reviewData = try JSONDecoder().decode(Review.self, from: jsonData)
                    completion(.success(reviewData))
                }catch{
                    print(jsonData)
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    
    func saveRating(_ ratingToSave:Rating, completion: @escaping(Result<Rating, APIError>) -> Void) {
           do {
               var urlRequest = URLRequest(url: resourceURL)
               urlRequest.httpMethod = "POST"
               urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
               urlRequest.httpBody = try JSONEncoder().encode(ratingToSave)
               
               let dataTask = URLSession.shared.dataTask(with:urlRequest){data, response, _ in
                   guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else{
                       completion(.failure(.responseProblem))
                       return
                   }
                   do{
                    let ratingData = try JSONDecoder().decode(Rating.self, from: jsonData)
                       completion(.success(ratingData))
                   }catch{
                       completion(.failure(.decodingProblem))
                   }
               }
               dataTask.resume()
           }catch{
               completion(.failure(.encodingProblem))
           }
       }
    
    func saveRestaurant(_ restaurantToSave:Restaurant, completion: @escaping(Result<Restaurant, APIError>) -> Void) {
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(restaurantToSave)
            
            let dataTask = URLSession.shared.dataTask(with:urlRequest){data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else{
                    completion(.failure(.responseProblem))
                    return
                }
                do{
                 let restaurantData = try JSONDecoder().decode(Restaurant.self, from: jsonData)
                    completion(.success(restaurantData))
                }catch{
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    func getRestaurants(_ restaurantToSave:Restaurant, completion: @escaping(Result<Restaurant, APIError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with:resourceURL){data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let restaurantsResponse = try decoder.decode(Restaurant.self, from: jsonData)
                completion(.success(restaurantsResponse))
            }catch{
                completion(.failure(.cannotProcess))
            }
        }

        
    }


}
