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
        //sets a url variable equal to type URL from the string which is the API for this project
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=genre:murder&key=AIzaSyCOUuJ0zi8KrMzvGN7LhJMtlqWjOaqKPjc")!
        
        //print("hi")
        URLSession.shared.dataTask(with: url) { (data, response, errors) in
            guard let data = data else {
                print("not good")
                print(errors?.localizedDescription)
                return
            }
            
            guard let dataAsString = String(data: data, encoding: .utf8) else{return}
            print(dataAsString)
            
            //decodes the information that the API gives and makes it so that the variables in the API can be used in the code
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                }
                
            }
            else{print("failed")}
            
        }.resume()//without this, the code would not run, this makes the code continue after all of the stuff above
    }
}

//Response struct with an array of Items
struct Response: Codable{
    var items: [Item] = [Item]()
}

//Item struct with variable for volumeInfor with a type Info
struct Item: Codable{
    var volumeInfo: Info
}

//info struct with the different variables that are being used from the API
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

