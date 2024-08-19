//
//  HomeUsersModel.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 05/09/22.
//



import Foundation

// MARK: - Welcome
class HomeUsersModel: Codable {
    let homeusers: [Homeuser]

    init(homeusers: [Homeuser]) {
        self.homeusers = homeusers
    }
    
   
}

// MARK: - Homeuser
class Homeuser: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company

    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAddress { response in
//     if let address = response.result.value {
//       ...
//     }
//   }

// MARK: - Address
class Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo

    init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseGeo { response in
//     if let geo = response.result.value {
//       ...
//     }
//   }

// MARK: - Geo
class Geo: Codable {
    let lat, lng: String

    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCompany { response in
//     if let company = response.result.value {
//       ...
//     }
//   }

// MARK: - Company
class Company: Codable {
    let name, catchPhrase, bs: String

    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}

