import Foundation

class FetchData: ObservableObject{
    
    @Published var responses: Response = Response()
    
    init(){
        
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=search-terms&key=AIzaSyCOUuJ0zi8KrMzvGN7LhJMtlqWjOaqKPjc")!
        
        URLSession.shared.dataTask(with: url) { (data, response, errors) in
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                }
            }
            
        }.resume()
    }
}

struct Response: Codable{
    var totalResults: Int = 0
    var items: [Item] = [Item]()
}

struct Item: Codable{
    var volumeInfo: [Info] = [Info]()
}

struct Info: Codable{
    var title: String?
    var authors: String?
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var buyLink: URL?
    var link : [Link] = [Link]()
}
struct Link: Codable{
    var thumbnail: URL?
}

// add an extension to the article struct so that we can use an array of articles
// to dinamically create List.
extension Item: Identifiable{
    var id: String {return title!}
}
