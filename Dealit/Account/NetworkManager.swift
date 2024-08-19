//
//  NetworkManager.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 10/01/22.
//

import Foundation

typealias Closure  = () -> ()
typealias JSON = [String:Any]
class NetworkManager: NSObject{
    static func getData(returnHandler:@escaping (HomePageModel) -> Void ){
       
      
        let url = URL(string: "https://mockjson-server.herokuapp.com/61e4232f7ca29572d1da5d2e")!

        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Ensure we have received valid data
            guard let data = data else {
                print("No data received")
                return
            }

            // Try to decode the data into the expected model
            do {
                let films = try JSONDecoder().decode(HomePageModel.self, from: data)
                // Call your handler with the decoded model
                returnHandler(films)
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }

        // Start the task
        task.resume()

    }
   
    static func getRequestAPI<T: Codable>(callBack: @escaping (T) -> Void, model: T.Type, url: String) {
        // Ensure the URL string can be converted to a URL
        guard let requestURL = URL(string: url) else {
            print("Invalid URL string")
            return
        }

        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Ensure we have received valid data
            guard let data = data else {
                print("No data received")
                return
            }

            // Try to decode the data into the expected model
            do {
                let decodedData = try JSONDecoder().decode(model, from: data)
                // Call your handler with the decoded model
                callBack(decodedData)
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }

        // Start the task
        task.resume()
    }

}
