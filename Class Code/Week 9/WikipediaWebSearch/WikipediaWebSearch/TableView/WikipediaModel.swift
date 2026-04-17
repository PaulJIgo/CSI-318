//
//  WikipediaModel.swift
//  WikipediaWebSearch
//
//  Created by Paul Igo on 3/26/25.
//

import UIKit
import Foundation
import Alamofire

class WikipediaModel: NSObject {
    let baseURL = "https://en.wikipedia.org/w/api.php"
    var data: ImageService? = nil
    
    func getURLs(_ query: String, completion: @escaping (Result<ImageService?, Error>) -> Void) {
        
        // Heres an example of one of the parameters
        let parameters = [
            "action" : "query",
            "format" : "json",
            "list" : "allimages",
            "ailimit": "40",
            "aifrom": query
        ]
        
        // Only request if we have a good URL
        if let url = URL(string: baseURL) {
            
            
            AF.request(url, parameters: parameters).responseDecodable(of: ImageService.self, completionHandler: { response in 
                    switch response.result {
                    case .success(let data): 
                        self.data = data
                        completion(.success(data))
                        
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            
            
        }
        
        
            
    }
    
}

extension WikipediaModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.query.allImages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if 
            let item = data?.query.allImages[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: "WikipediaCell") as? WikipediaCell {
            
            cell.configure(vm: item)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}



struct ImageService: Codable {
    var query: Query
}

struct Query: Codable {
    var allImages: [Image]
    
    enum CodingKeys: String, CodingKey {
        case allImages = "allimages"
    }
}

struct Image: Codable { 
    var url: String
    var descriptionUrl: String
    var name: String
    var title: String 
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case descriptionUrl = "descriptionurl"
        case name
        case title
    }
}
