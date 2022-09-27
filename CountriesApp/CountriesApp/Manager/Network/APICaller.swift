//
//  APICaller.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 25.09.2022.
//

import Foundation
import Alamofire

enum Methods: String {
    case GET = "GET"
}

struct NetworkConstant {
    static let apiHeader = "X-RapidAPI-Key"
    static let apiKey = "2e2214a28dmsh726a303b3f6045bp1d96f4jsn123656bbb0f7"
    static let apiURL = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    public func request<T: Codable>(from endPoint: Endpoint, completionHandler: @escaping (Result<T, Error>) -> Void) {
        let urlString = endPoint.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString ?? "")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(NetworkConstant.apiKey, forHTTPHeaderField: NetworkConstant.apiHeader)
        urlRequest.httpMethod = Methods.GET.rawValue
        
        AF.request(urlRequest).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    completionHandler(.success(data))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }
}

