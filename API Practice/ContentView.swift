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
        
        NavigationView{
           List(fetchData.responses.items){ item in
                NavigationLink(
                    destination: Format(item: item), label: {
                        HStack{
                            
                            if let image = item.volumeInfo.imageLinks.thumbnail{
                                KFImage(URL(string: image))
                            }
                            else{
                                Image("notfound").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 50)
                            }
                            //Image("notfound").resizable().aspectRatio(contentMode: .fill).frame(width:100, height: 50)
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
