//
//  ApiManager.swift
//  NewsFarhat
//
//  Created by Фархат Сталбек уулу on 3/4/23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager ()
    
//    let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-03-04&sortBy=publishedAt&apiKey=04434e7b1d04485d9fc127144948e33a"
    let urlString = "https://dummyjson.com/products"
    
    func getData(completion: @escaping(Result<NewsData, Error>) -> Void) {
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {return}
            
            do {
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                completion(.success(newsData))
            }catch {
                completion(.failure (error))
            }
        }
        task.resume()
    }
}
