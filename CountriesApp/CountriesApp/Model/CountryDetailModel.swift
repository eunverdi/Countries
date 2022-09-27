//
//  CountryDetailModel.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 26.09.2022.
//

import Foundation

struct CountryDetailModel: Codable {
    var data: CountryDetailDataClass?
}
    
struct CountryDetailDataClass: Codable {
    var code: String?
    var flagImageURI: String?
    var name: String?
    var wikiDataID: String?

    enum CodingKeys: String, CodingKey {
        case code
        case flagImageURI = "flagImageUri"
        case name
        case wikiDataID = "wikiDataId"
    }
}
