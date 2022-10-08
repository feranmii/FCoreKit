//
//  DefaultNetworkService.swift
//
//
//  Created by Feranmi Oladosu on 02/10/2022.
//

import Foundation

public final class DefaultNetworkService<Source: NetworkResource>: NetworkService {
       
    public init() {}
    
    public func request<T>(with resource: Source) async -> Result<T, NetworkError> where T: Codable {
        let urlRequest = URLRequest(networkResource: resource)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.serverError(.wrongData))
            }
            
            switch httpResponse.statusCode {
            case 200..<300:
                do {
                    print("🚀 \n", String(data: data, encoding: .utf8), "\n 🚀")
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return .success(decodedData)
                } catch {
                    return .failure(.serverError(.decodingError(error)))
                }
            case 400..<500:
                return .failure(.requestError(.invalidRequest(urlRequest)))
                        
            case 500..<600:
                return .failure(.serverError(.internalServerError))
            default:
                return .failure(.serverError(.other(statusCode: 0, response: httpResponse)))
            }
        } catch {
            return .failure(.requestError(.other(error)))
        }
    }
}
