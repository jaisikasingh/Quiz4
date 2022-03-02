//
//  Network.swift
//  Quiz4
//
//  Created by Jaisika Singh on 2022-03-02.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    @Published var comments: [Comment] = []

    func getComments() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedComments = try JSONDecoder().decode([Comment].self, from: data)
                        self.comments = decodedComments
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
