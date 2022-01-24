//
//  Format.swift
//  API Practice
//
//  Created by Jonathan Miller (student LM) on 1/11/22.
//

import SwiftUI
import struct Kingfisher.KFImage

//formats the authors, so that the list displays correctly
//function that is entered an array of strings, and displays a string
func authors_Format(authors: [String])->String{
    
    var new = ""
    var count = 0
    
    //for loop to add each author consecutivley
    for author in authors{
        
        //if there is more than one author- count is 0, so if authors.count is equal to one, then count will equal authors.count when one is subtracted
        if count != authors.count - 1{
           
            //adds the next author to the new string of authors
            new += author + ", "
        }
        else{
            //if the count of authors is just 1, then only that author will be added to the string, without a comma
            new += author
        }
        //adds one to count, because this ensures that another author will not be added with a comma if the max number of authors has been reached
        count += 1
    }
    return new
}

//creates proper formatting for variables in project, to be used in contentview
struct Format: View {
    
    var item: Item
    //the item is created as a type Item as referenced from the content view
    
    var body: some View {
       //this NavigationView allows for all of the information to be visible on the screen in the view created in the content view
        
        //uses variable volumeInfo to access information about a specific book
        //volume Info refers to the struct Info, where each variable is initilized with info from the API link
        
        //ensures that the additional information displayed with each book can be scrolled through, as there is too much to view on just one screen
        ScrollView{
    
            //formats each piece of information evenly on top of each other, vertically
            VStack{
               
                //declares the image to equal the thumbnail provided in the JSON data, and unwraps the value, or makes sure that it exists, before attempting to display the image
                if let image = item.volumeInfo.imageLinks.thumbnail{
                    
                    //changes any http to https in order for the link to run correctly
                    let replaced = image.replacingOccurrences(of: "http", with: "https")
                   
                    //code to actually display the image
                    //formats it correctly, with a size of 150 by 300, and making sure the ratio is correct within the bounds of the app display
                    KFImage(URL(string: replaced)).resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 300)
                        //uses the replaced string, to make sure the correct image is used and that it works
                }//end if
                //if the image does not exist, if statement moves onto the else statement
                else{
                    //displays an image that can be found in the assets folder, with the name "notfound"
                    Image("notfound").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 50)
                }//end else
                
                //displays the title. because this value is not an optional, it does not have to be unwrapped with an if statement 
                Text(item.volumeInfo.title).font(.system(size: 20, weight: .bold))
                    //formats the title to be bold, with a larger font then the rest of the text, and properly fit and align
                    .frame(width: 300).multilineTextAlignment(.center)
                Text("")
                
                //unwraps the optional variable description from the JSON
                if let d = item.volumeInfo.description{
                    //formats description correctly, bolding it, making it size 14 font, making it italic, and providing a frame to make sure it fits in the bounds of the app
                    (Text("Description: ").bold() + Text(d).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading).fixedSize(horizontal: false, vertical: true)
                }
                
                //unwraps the optional variable of authors
                if let a = item.volumeInfo.authors{
                    //if statement that checks if there is only one author
                    if a.count == 1{
                        //if there is only one author just use the word Author:
                        (Text("Author: ").bold() + Text(authors_Format(authors: a)).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                    }//end inner if
                    //if the count is not 1, i.e. there are multiple authors
                    else{
                        //if there are more than one authors, use the word Authors: when displaying them
                        (Text("Authors: ").bold() + Text(authors_Format(authors: a)).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                    }//end else
                }//end outer if
                
                //unwraps the optional varible of the publisher 
                if let p = item.volumeInfo.publisher{
                    //formats the text of the publisher
                    (Text("Publisher: ").bold() + Text(p).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                }//end if
                
                //unwraps the optional variable of the published date
                if let pd = item.volumeInfo.publishedDate{
                    //formats text of published date
                    (Text("Published Date: ").bold() + Text(pd).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                }//end if
                
                //spaces all of the information out from the bottom of the screen
                Spacer()
                
            }//end vstack
        }//end scrollView
    }
}
struct Format_Previews: PreviewProvider {
    static var previews: some View {
        Format(item: Item(volumeInfo: Info(title: "", authors: [""], publisher: "", publishedDate: "", description: "", buyLink: nil, imageLinks: Link(thumbnail: nil))))
    }//end preview
}//end struct

