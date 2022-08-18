//
//  WebView.swift
//  H4X0R_News
//
//  Created by Daniela Lima on 2022-07-31.
//

import Foundation
import WebKit
import SwiftUI

//to display a window that shows the content of a URL
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    //will create a UIKit WebView and turn into a SwiftUI View
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    //to update UIView, gonna use the URL that got passed into the DetailView
    //and try to render a WebKitView that uses that URL
    func updateUIView(_ uiView: WKWebView, context: Context) {
        //First, check if the url string has some content
        if let safeString = urlString {
            //if safeString is not nil, gonna use the unwrapped safeString
            if let url = URL(string: safeString) {
                //create a request from URL, which is a URLRequest, and pass in the URL as the safeURL
                let request = URLRequest(url: url)
                //use the UIView with load method to load our request
                uiView.load(request)
            }
        }
        typealias UIViewType = WKWebView
    }
}
