//
//  NetworkManager.swift
//  H4XOR
//
//  Created by Deepanshu Gautam on 13/11/22.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    func fetchData() {
        let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")
        if let safeURL = url {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: safeURL) { data, response, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
