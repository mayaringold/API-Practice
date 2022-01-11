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
                    destination: SwiftUIWebView(url: item.volumeInfo.buyLink!), label: {
                        HStack{
                            /*if let image = article.urlToImage{
                                KFImage(image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 50)
                            }
                            else{
                                Image("notfound")
                            }
                            
                            Text(article.title!)
                            Text(article.url!)*/
                            
                            KFImage(item.volumeInfo.link.thumbnail).resizable().aspectRatio(contentMode: .fit).frame(width:100, height: 50, alignment: .center)
                            Text(item.volumeInfo.title ?? "No Title")
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
