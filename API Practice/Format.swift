//
//  Format.swift
//  API Practice
//
//  Created by Jonathan Miller (student LM) on 1/11/22.
//

import SwiftUI

//struct creates proper formatting for variables in 
struct Format: View {
    
    var item: Item
    
    var body: some View {
        VStack{
            Text(item.volumeInfo.title)
            Text(item.volumeInfo.authors)
            Text(item.volumeInfo.description!)
            Text(item.volumeInfo.publisher!)
            Text(item.volumeInfo.publishedDate!)
            Text(item.volumeInfo.buyLink!)
        }
    }
}

