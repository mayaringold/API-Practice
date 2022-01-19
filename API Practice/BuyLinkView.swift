//
//  BuyLinkView.swift
//  API Practice
//
//  Created by Maya Ringold (student LM) on 1/14/22.
//

import SwiftUI

struct BuyLinkView: View {
    
    let url: URL?
    
    var body: some View{
        
        SwiftUIWebView(url: url)
    }
}

struct BuyLinkView_Previews: PreviewProvider {
    static var previews: some View {
        BuyLinkView(url: URL(string: "https://www.google.com"))
        //error because something is a URL that should be a string
    }
}

