//
//  DetailView.swift
//  H4X0R_News
//
//  Created by Daniela Lima on 2022-07-31.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

//When the DetailView loads up, it gets passed a URL string which gets used to create a WebView from a UIKit component which is called WkWebView
//Once that gets created, the we update it by loading the url that is meant to show in our DetailView
