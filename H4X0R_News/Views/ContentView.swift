//
//  ContentView.swift
//  H4X0R_News
//
//  Created by Daniela Lima on 2022-07-31.
//

import SwiftUI

struct ContentView: View {
    
    //this object will listen to content changes in NetworkManager
    //@ObservedOject property wrapper, so that views can watch the state of an external object
    //and be notified when something important has changed
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        //NavigationView is to navigate between screens, with the ability to go backwards easily
        NavigationView {
            //ListVIew is a container that presents vertically scrollable data arranged in a single column.
            //ListView is an alternative to ScrollView in terms of memory and performance.
            //Instead of using a normal list initializer, use the one which takes a piece of data,
            //and computes that row using that data, and provide a piece of data that conforms to the identifiable protocol.
            //So that we don't have to create a text component every single time we want to show it in the app.
            //In this case, we only need to use one text component, and go through an array to pull out each item
            //to put inside text component.
            //To use the Post object to show each of these titles in its own cell in my list,
            //have a single text item and only change the string that goes inside it
            //The data is the array of posts
            //Row content is going to take a closure which inputs an identifiable piece of data and outputs a View.
            //Because closure was the last one of the list, could turn into a trailling closure
            List(networkManager.posts) { post in
                //whenever a user clicks on one of the items on the list, it should take them to the DetailView
                //NaviationLink creates a button on the right-hand side of each cell
                //this button is going to trigger a presentation to DetailView when pressed
                NavigationLink(destination: DetailView(url: post.url)) {
                    //For every single post in our posts array, use each of these posts items to create a new Text object
                    //The text View is going to be populated using each post's title property
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            //create navigationTitle just before the NavigationView ends
            .navigationTitle("H4X0R NEWS")
        }
        //onAppear is almost like viewDidLoad
        //we can pass a function that will be performed when body View appears on the screen
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


