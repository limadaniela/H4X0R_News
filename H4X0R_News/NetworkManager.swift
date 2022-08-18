//
//  NetworkManager.swift
//  H4X0R_News
//
//  Created by Daniela Lima on 2022-07-31.
//

import Foundation
import SwiftUI

//ObservableObject is used to pass the results from NetworkManager to the List inside the ContentView
//so that when important changes happen, the view will reload
class NetworkManager: ObservableObject {
    
    //@Published property wrapper, so that changes to posts should trigger a rebuild of our List
    @Published var posts = [Post]()
    
    func fetchData() {
        //create a URL from a string
        //url for All stories that are on the front/home page right now
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            //if able to generate a URL from string, create a session object from URLSession class
            // initialize URLSession using default configuration
            let session = URLSession(configuration: .default)
            //create task set to session.data task
            //choose initializer that takes a URL and has a completionHandler with the data we get back, response and error
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    //to decode the data that we get back from networking session
                    //for that, create a struct to represent the properties that we want out of this result
                    let decoder = JSONDecoder()
                    //as the data that comes back from networking is an optional, need to optinally bind it to safe data
                    //should wrap the method into a do catch block
                    if let safeData = data {
                        do {
                            //because this decode method can throw, we have to call it using the keyword "try"
                            //once data is decoded, can bind it to a constant code results
                            //Then, we can use results to populate our list
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            //make sure to fecth the main thread to use @Published
                            DispatchQueue.main.async {
                                //once networking completes, and we get hold of the data from the API
                                //then, we can set posts equal results.hits
                                //hits is an array of Post objects
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            //start the task
            task.resume()
        }
    }
}
