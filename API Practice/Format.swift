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
    //the item is created as a type Item as referenced from the content view
    
    var body: some View {
       //this NavigationView allows for all of the information to be visible on the screen in the view created in the content view
        
        NavigationView{
            //uses variable volumeInfo to access information about a specific book
            //volume Info refers to the struct Info, where each variable is initilized with info from the API link 
            Text(item.volumeInfo.title)//displays the title for a specific volume
            Text(item.volumeInfo.authors)//displays the author(s) for a specific volume
            Text(item.volumeInfo.description!)//displays the book description for a specific volume
            Text(item.volumeInfo.publisher!)//displays the publisher for a specific volume
            Text(item.volumeInfo.publishedDate!)//displays the published date for a specific volume
            

            NavigationLink("Buy Me!", destination: BuyLinkView(url: URL(string: item.volumeInfo.buyLink!)))
            //This navigation link allows for the BuyLinkView to be operational, it gives acces to the BuyLinkView for the viewer to click on, it uses the url URL? created in the buyLinkView and then gets the link from the variables from the data parsing class that reference the JSON
        }
    }
}
struct Format_Previews: PreviewProvider {
    static var previews: some View {
        Format(item: Item(volumeInfo: Info(title: "", authors: "", publisher: "", publishedDate: "", description: "", buyLink: nil, imageLinks: Link(thumbnail: nil))))
    }
}

