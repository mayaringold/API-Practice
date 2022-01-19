//
//  BuyLinkView.swift
//  API Practice
//
//  Created by Maya Ringold (student LM) on 1/14/22.
//

import SwiftUI

struct BuyLinkView: View {
    //makes the BuyLink able to be viewed
    
    let url: URL?
    //declares a variable with type URL?
    
    var body: some View{
        
        SwiftUIWebView(url: url)
        //makes it so that the BuyLink is able to be used in the new view
    }
}

struct BuyLinkView_Previews: PreviewProvider {
    static var previews: some View {
        BuyLinkView(url: URL(string: "https://www.google.com"))
        //preview view passed google as a string prior to reciving other links
        
    }
}

