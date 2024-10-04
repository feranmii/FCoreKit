//
//  SpacingTokens.swift
//  FCoreKit
//
//  Created by Feranmi Oladosu on 29/09/2024.
//

import SwiftUI

public enum RadiusTokens: CaseIterable {
    case none
    case xs
    case s
    case m
    case l
    case xl
    case custom(CGFloat)

    public var value: CGFloat {
        switch self {
        case .none:
            return 0
        case .xs:
            return 2
        case .s:
            return 4
        case .m:
            return 8
        case .l:
            return 16
        case .xl:
            return 32
        case .custom(let newValue):
            return newValue
        }
    }
    
    public static var allCases: [RadiusTokens] {
        return [.none, .xs, .s, .m, .l, .xl, .custom(64)]
    }
}
