//
//  NetworkManager.swift
//  Post
//
//  Created by Игорь Чумиков on 30.09.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(from url: String?, with completion: @escaping ([Post]) -> Void) {
        
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else {return}
        URLSession.shared.dataTask(with: url) {( data, _, error ) in
            
            guard let data = data else { return }
            do {
                guard let posts = try? JSONDecoder().decode([Post].self, from: data) else { return }
                DispatchQueue.main.async {
                    completion(posts)
                }
            } catch let error {
                print("Ошибка получения данных: \(error)")
            }
        }.resume()
    }
}
