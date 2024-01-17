//
//  ApiManager.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import Foundation

class APIManager {
    static let shared = APIManager()

    private init() {}

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    

    func makeAPIRequest<T: Decodable>(
            url: String,
            method: HTTPMethod = .get,
            headers: [String: String]? = nil,
            jwtRequired: Bool = false
        ) async throws -> T {
             // Your optional URL here

            guard let _url = URL(string: url) else {
                throw NetworkError.invalidResponse
            }
            
            var request = URLRequest(url: _url)
            request.httpMethod = method.rawValue
            if jwtRequired {
               
            }

            headers?.forEach { key, value in
                request.addValue(value, forHTTPHeaderField: key)
            }

            let (data, response) = try await URLSession.shared.data(for:request)

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidResponse
            }

            do {
                let decoder = JSONDecoder()
                print(data)
                return try decoder.decode(T.self, from: data)
            } catch {
                throw error
            }
        }
}

enum NetworkError: Error {
    case invalidResponse
}

