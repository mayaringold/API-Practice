//
//  Format.swift
//  API Practice
//
//  Created by Jonathan Miller (student LM) on 1/11/22.
//

import SwiftUI

//creates proper formatting for variables in project, to be used in contentview
struct Format: View {
    
    var item: Item
    
    var body: some View {
        NavigationView{
            //uses variable volumeInfo to access information about a specific book
            //volume Info refers to the struct Info, where each variable is initilized with info from the API link 
            Text(item.volumeInfo.title)
            Text(item.volumeInfo.authors)
            Text(item.volumeInfo.description!)
            Text(item.volumeInfo.publisher!)
            Text(item.volumeInfo.publishedDate!)
            
            NavigationLink("Buy Me!", destination: BuyLinkView(url: item.volumeInfo.buyLink!))
            
        }
    }
}
struct Format_Previews: PreviewProvider {
    static var previews: some View {
        Format(item: Item(volumeInfo: Info(title: "", authors: "", publisher: "", publishedDate: "", description: "", buyLink: nil, imageLinks: Link(thumbnail: nil))))
    }
}

