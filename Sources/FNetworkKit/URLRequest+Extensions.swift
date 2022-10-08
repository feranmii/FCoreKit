//
//  URLRequest+Extensions.swift
//  
//
//  Created by Feranmi Oladosu on 02/10/2022.
//

import Foundation

internal extension URLRequest {
    
    init(networkResource: NetworkResource) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = networkResource.baseURL
        urlComponents.path = networkResource.endpoint.path
        urlComponents.queryItems = networkResource.endpoint.urlQueryItems
        
        guard let url = urlComponents.url else {
            preconditionFailure("Invalid URL \(urlComponents)")
        }
        
        self.init(url: url)
        
        httpMethod = networkResource.endpoint.method.rawValue
        
        allHTTPHeaderFields = networkResource.headers
        
        if let encodableData = networkResource.endpoint.body {
            guard let body = try? JSONEncoder().encode(encodableData) else {
                preconditionFailure("Invalid body data \(urlComponents)")
            }
            
            httpBody = body
        }
    }
    
}
