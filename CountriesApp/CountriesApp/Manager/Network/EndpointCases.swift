//
//  EndpointCases.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 26.09.2022.
//

import Foundation
import Alamofire

enum EndpointCases: Endpoint {
    case getCountries
    case getCountryDetail(countryCode: String)
    
    var baseURLString: String {
        return NetworkConstant.apiURL
    }
    
    var path: String {
        switch self {
        case .getCountries:
            return "/?limit=10"
        case .getCountryDetail(let countryCode):
            return "/" + countryCode
        }
    }
}
