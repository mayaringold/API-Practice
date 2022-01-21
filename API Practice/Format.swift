//
//  Format.swift
//  API Practice
//
//  Created by Jonathan Miller (student LM) on 1/11/22.
//

import SwiftUI
import struct Kingfisher.KFImage

func authors_Format(authors: [String])->String{
    
    var new = ""
    var count = 0
    
    for author in authors{
        if count != authors.count - 1{
            new += author + ", "
        }
        else{
            new += author
        }
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
        
        ScrollView{
    
            VStack{
                if let image = item.volumeInfo.imageLinks.thumbnail{
                    let replaced = image.replacingOccurrences(of: "http", with: "https")
                    KFImage(URL(string: replaced)).resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 300)
                    
                }
                else{
                    Image("notfound").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 50)
                }
                Text(item.volumeInfo.title).font(.system(size: 20, weight: .bold))
                    .frame(width: 300).multilineTextAlignment(.center)
                Text("")
                if let d = item.volumeInfo.description{
                    (Text("Description: ").bold() + Text(d).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading).fixedSize(horizontal: false, vertical: true)
                }
                if let a = item.volumeInfo.authors{
                    if a.count == 1{
                        (Text("Author: ").bold() + Text(authors_Format(authors: a)).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                    }
                    else{
                        (Text("Authors: ").bold() + Text(authors_Format(authors: a)).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                    }
                }
                if let p = item.volumeInfo.publisher{
                    (Text("Publisher: ").bold() + Text(p).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                }
                if let pd = item.volumeInfo.publishedDate{
                    (Text("Published Date: ").bold() + Text(pd).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
                }
                Spacer()
            }
        }
    }
}
struct Format_Previews: PreviewProvider {
    static var previews: some View {
        Format(item: Item(volumeInfo: Info(title: "", authors: [""], publisher: "", publishedDate: "", description: "", buyLink: nil, imageLinks: Link(thumbnail: nil))))
    }
}

