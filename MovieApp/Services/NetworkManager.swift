//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Клоун on 07.10.2022.
//

import Foundation

enum MovieError: Error {
    case invalidUrl, failureToGetData, noData
}

class NetworkManager {    
    static func getMovies<T: Codable>(url: String, completion: @escaping(Result<T, MovieError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            do {
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                let movieData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(movieData))
            } catch {
                completion(.failure(.failureToGetData))
            }
        }.resume()
    }
    
    static func getImage(url: String) -> Data? {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + url) else { return Data() }
        let data = try? Data(contentsOf: url)
        return data
    }
}
