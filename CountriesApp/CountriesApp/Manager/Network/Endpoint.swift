//
//  Endpoint.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 26.09.2022.
//

import Foundation
import Alamofire

protocol Endpoint {
    var baseURLString: String { get }
    var path: String { get }
}

extension Endpoint {
    var url: String {
        return baseURLString + path
    }
}

