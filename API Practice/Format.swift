//
//  Format.swift
//  API Practice
//
//  Created by Jonathan Miller (student LM) on 1/11/22.
//

import SwiftUI

struct Format: View {
    
    var item: Item
    
    var body: some View {
        VStack{
            Text(item.volumeInfo.title)
            Text(item.volumeInfo.authors)
            Text(item.volumeInfo.description!)
            Text(item.volumeInfo.publisher!)
        }
    }
}

struct Format_Previews: PreviewProvider {
    static var previews: some View {
        Format(item: Item(volumeInfo: Info(title: "", authors: "", publisher: "", publishedDate: "", description: "", buyLink: nil, imageLinks: Link(thumbnail: nil))))
    }
}
