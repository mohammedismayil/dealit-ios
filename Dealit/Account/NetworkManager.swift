//
//  NetworkManager.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 10/01/22.
//

import Foundation

import Alamofire

typealias Closure  = () -> ()
class NetworkManager: NSObject{
    static func getData(returnHandler:@escaping (HomePageModel) -> Void ){
       
        
        AF.request("https://mockjson-server.herokuapp.com/61e4232f7ca29572d1da5d2e").responseDecodable(of: HomePageModel.self) { response in
//            debugPrint(response)
            guard let films = response.value else { return }
             returnHandler(films)
        }
    }
}
