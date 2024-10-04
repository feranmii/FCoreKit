//
//  SpacingTokens.swift
//  FCoreKit
//
//  Created by Feranmi Oladosu on 29/09/2024.
//

import SwiftUI

// MARK: - SpacingTokens

public enum SpacingTokens: CaseIterable {
    case none
    case s
    case m
    case l
    case xl
    case xxl

    public var value: CGFloat {
        switch self {
        case .none:
            return 0
        case .s:
            return 8
        case .m:
            return 16
        case .l:
            return 24
        case .xl:
            return 32
        case .xxl:
            return 64
        }
    }
}
