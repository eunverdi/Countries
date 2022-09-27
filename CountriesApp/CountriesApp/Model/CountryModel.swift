//
//  CountryModel.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 25.09.2022.
//

import Foundation

struct CountryResponse: Codable {
    let data: [Country]
}

struct Country: Codable {
    let code: String
    let name: String
}
