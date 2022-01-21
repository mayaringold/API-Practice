//
//  ContentView.swift
//  API Practice
//
//  Created by Maya Ringold (student LM) on 1/4/22.
//

import SwiftUI

import struct Kingfisher.KFImage

struct ContentView: View {
    
    @StateObject var fetchData = FetchData()
    
    var body: some View {
        
        //Navigation view allows for all items in the response array to be displayed
        NavigationView{
          //places the items in a list using the navigation view
            List(fetchData.responses.items){ item in
               //the navigation link allows for the items from the content view to go to the format class to be used
                NavigationLink(
                    //the destination of the navigation link is the Format class with type item
                    destination: Format(item: item), label: {
                        
                        //the label for the NavLink is an image that is displayed on the left of the screen
                        HStack{//HStack to place items horizontally
                            
                            //goes from the item to the volume info to the image link to the thumbnail in order to get the picture to be displayed
                            if let image = item.volumeInfo.imageLinks.thumbnail{
                                //creates a replaced variable to be used to replace "http" with "https" so that the images will display
                                let replaced = image.replacingOccurrences(of: "http", with: "https")
                                //replaces the instance refrenced in the previous line
                                KFImage(URL(string: replaced))
                            }
                            else{
                                //displays notfound if the image is not able to be displayed
                                Image("notfound").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 50)
                            }
                            //displays the title of the specific book next to the image
                            Text(item.volumeInfo.title)
                        }
                    })
           }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
