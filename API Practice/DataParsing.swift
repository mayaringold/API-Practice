//
//  Format.swift
//  API Practice
//
//  Created by Jonathan Miller (student LM) on 1/4/22.
//
import Foundation

class FetchData: ObservableObject{
    
    @Published var responses: Response = Response()
    
    init(){
        
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=murder-terms&key=AIzaSyCOUuJ0zi8KrMzvGN7LhJMtlqWjOaqKPjc")!
        //print("hi")
        URLSession.shared.dataTask(with: url) { (data, response, errors) in
            guard let data = data else {
                print("not good")
                print(errors?.localizedDescription)
                return
                
            }
            
            guard let dataAsString = String(data: data, encoding: .utf8) else{return}
            print(dataAsString)
            
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                }
                
            }
            else{print("failed")}

        }.resume()
    }
}

struct Response: Codable{
    var items: [Item] = [Item]()
}

struct Item: Codable{
    var volumeInfo: Info
}

struct Info: Codable{
    var title : String
    var authors : [String]?
    var publisher : String?
    var publishedDate : String?
    var description : String?
    var buyLink : String?
    var imageLinks: Link
}

struct Link: Codable{
    var thumbnail: String?
}

// add an extension to the article struct so that we can use an array of articles
// to dinamically create List.
extension Item: Identifiable{
    var id: String {return volumeInfo.title}
}

