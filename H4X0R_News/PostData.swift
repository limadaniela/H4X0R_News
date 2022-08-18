//
//  PostData.swift
//  H4X0R_News
//
//  Created by Daniela Lima on 2022-07-31.
//

import Foundation

//conform to Decodable protocol so we can use JSON decoder to decode data into a Result struct
struct Results: Decodable {
    //hits has a data format of an array of Post objects
    let hits: [Post]
}

//define Post object and its properties
//Make it conform to a protocol called "Identifiable", for the list to know how to order each item
//to be identifiable, it must have a property code ID
//as we already got an identifier which identifies each post, use computed property to turn id equal to objectID
//So, whenever you try to fetch the ID, it's going to look at the value of objectID and assign it to id property (var id)
struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
