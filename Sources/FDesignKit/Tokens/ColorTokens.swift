//
//  ColorTokens.swift
//  FCoreKit
//
//  Created by Feranmi Oladosu on 29/09/2024.
//

import SwiftUI

public protocol FDColorTokens {
    var accentColor: Color { get }
    var primaryBackgroundColor: Color { get }
    var secondaryBackgroundColor: Color { get }
    var textTitleColor: Color { get }
    var textBodyColor: Color { get }

    // MARK: - Semantic Colors (Success, Error, Warning)

    var successColor: Color { get }

    var errorColor: Color { get }

    var warningColor: Color { get }
}
