//
//  File.swift
//  
//
//  Created by Feranmi Oladosu on 02/10/2022.
//

import Foundation

public enum NetworkError: Error {
    public enum RequestError {
        case invalidRequest(URLRequest)
        case encodingError(Error)
        case other(Error)
    }
    
    public enum ServerError {
        case decodingError(Error)
        case noInternetConnection
        case timeout
        case internalServerError
        case wrongData
        case other(statusCode: Int, response: HTTPURLResponse)
    }
    
    case requestError(RequestError)
    case serverError(ServerError)
}
