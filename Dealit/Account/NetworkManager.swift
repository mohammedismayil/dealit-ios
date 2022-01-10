//
//  NetworkManager.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 10/01/22.
//

import Foundation

import Alamofire
class NetworkManager: NSObject{
    static func getData(returnHandler:@escaping (HomePageModel) -> Void ){
       
        
        AF.request("https://mockjson-server.herokuapp.com/61dc780d1112c20f181e042a").responseDecodable(of: HomePageModel.self) { response in
            debugPrint(response)
            guard let films = response.value else { return }
             returnHandler(films)
        }
    }
}
