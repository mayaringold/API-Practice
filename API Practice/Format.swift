//
//  Format.swift
//  API Practice
//
//  Created by Jonathan Miller (student LM) on 1/11/22.
//

import SwiftUI

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
    
    var body: some View {
        
        //uses variable volumeInfo to access information about a specific book
        //volume Info refers to the struct Info, where each variable is initilized with info from the API link
        Text(item.volumeInfo.title).font(.system(size: 20, weight: .bold))
            .frame(width: 300).multilineTextAlignment(.center)
        Text("")
        if let d = item.volumeInfo.description{
            (Text("Description: ").bold() + Text(d).font(.system(size: 14)).italic()).frame(width: 300, alignment: .topLeading)
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
        NavigationView{
            
            if let bL = item.volumeInfo.buyLink{
                NavigationLink("Buy Me!", destination: BuyLinkView(url: URL(string: bL)))
            }
        }
    }
}

struct Format_Previews: PreviewProvider {
    static var previews: some View {
        Format(item: Item(volumeInfo: Info(title: "", authors: [""], publisher: "", publishedDate: "", description: "", buyLink: nil, imageLinks: Link(thumbnail: nil))))
    }
}

