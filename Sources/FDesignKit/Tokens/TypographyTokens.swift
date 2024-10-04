//
//  TypographyTokens.swift
//  FCoreKit
//
//  Created by Feranmi Oladosu on 29/09/2024.
//

import SwiftUI

public enum TypographyTokens: CaseIterable {
    case headline
    case headlineSmall
    case title
    case titleSmall
    case body
    case caption
    case captionTiny

    public var value: Font {
        switch self {
        case .headline:
            return .system(size: 34, weight: .heavy)
        case .headlineSmall:
            return .system(size: 22, weight: .heavy)
        case .title:
            return .system(size: 17, weight: .bold)
        case .titleSmall:
            return .system(size: 15, weight: .bold)
        case .body:
            return .system(size: 16, weight: .regular)
        case .caption:
            return .system(size: 12, weight: .medium)
        case .captionTiny:
            return .system(size: 11, weight: .medium)
        }
    }
}

/* OLD IMPLEMENTATION
 public protocol TypographyTokens {
     var titleFont: Font { get }
     var bodyFont: Font { get }
     var captionFont: Font { get }
     func custom(size: CGFloat, weight: Font.Weight) -> Font
 }

 public struct DefaultTypographyTokens: TypographyTokens {

     public var titleFont: Font = .system(size: 24)
     public var bodyFont: Font = .system(size: 16)
     public var captionFont: Font = .system(size: 12)
     public func custom(size: CGFloat, weight: Font.Weight) -> Font {
         .system(size: size, weight: weight)
     }

 }
 */
