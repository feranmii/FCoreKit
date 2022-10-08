//
//  File.swift
//
//
//  Created by Feranmi Oladosu on 02/10/2022.
//

import Foundation

public enum Endpoint {
    case get(path: String, queryItems: [URLQueryItem] = [])
    case post(path: String, data: Encodable)
    case put(path: String, data: Encodable)
    case patch(path: String, data: Encodable)
    case delete(path: String)

    internal enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }

    internal var path: String {
        switch self {
        case let .get(path, _),
             let .post(path, _),
             let .put(path, _),
             let .patch(path, _),
             let .delete(path):
            return path
        }
    }

    internal var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .patch:
            return .patch
        case .delete:
            return .delete
        }
    }

    internal var urlQueryItems: [URLQueryItem] {
        if case let .get(_, queryItems) = self {
            return queryItems
        } else {
            return []
        }
    }

    internal var body: Encodable? {
        switch self {
        case let .post(_, data),
             let .put(_, data),
             let .patch(_, data):
            return data
        case .get, .delete: return nil
        }
    }
}
