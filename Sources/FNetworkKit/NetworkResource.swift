//
//  NetworkResource.swift
//  
//
//  Created by Feranmi Oladosu on 02/10/2022.
//

import Foundation

public protocol NetworkResource {
    var baseURL: String { get }
    var endpoint: Endpoint { get }
    var headers: [String: String] { get }
}
