//
//  NetworkService.swift
//  
//
//  Created by Feranmi Oladosu on 02/10/2022.
//

import Foundation

protocol NetworkService {
    
    associatedtype Resource
    
    func request<T: Codable>(with: Resource) async -> Result<T, NetworkError>
    
}
