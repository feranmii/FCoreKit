//
//  FConfigKit.swift
//  FCoreKit
//
//  Created by Feranmi Oladosu on 29/09/2024.
//

// MARK: - Environment

import SwiftUI

// MARK: - Environment

public enum Environment {
    case development
    case staging
    case production
}

// MARK: - AppAppearance

// TODO: Move this to a app settings section
public enum AppAppearance: String, CaseIterable {
    case light
    case dark
    case system

    public var value: ColorScheme? {
        switch self {
        case .light:
            .light
        case .dark:
            .dark
        case .system:
            nil
        }
    }
    
    public var description: String {
        switch self {
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        case .system:
            return "System"

        }
    }
}

// MARK: - AppConfig

final class AppConfig {
    public static let shared = AppConfig()
    private var environment: Environment
    private var configurations: [String: Any]
    private var featureFlags: [String: Bool]

    private init() {
        self.environment = .development
        self.configurations = [:]
        self.featureFlags = [:]
        loadConfigurations()
    }

    private func loadConfigurations() {
        // Load configurations from a plist file or remote source
        // This is a placeholder implementation

        configurations = [
            "API_URL": "https://api.example.com",
            "API_KEY": "your-api-key",
        ]

        featureFlags = [
            "enable_new_feature": true,
            "use_new_algorithm": false,
        ]
    }

    public func setEnvironment(_ env: Environment) {
        environment = env
        loadConfigurations() // Reload configurations for the new environment
    }

    public func getConfiguration(_ key: String) -> Any? {
        return configurations[key]
    }

    public func isFeatureEnabled(_ flag: String) -> Bool {
        return featureFlags[flag] ?? false
    }

    public func getCurrentEnvironment() -> Environment {
        return environment
    }

    // Usage example:
    // let apiUrl = AppConfig.shared.getConfiguration("API_URL") as? String
    // let isNewFeatureEnabled = AppConfig.shared.isFeatureEnabled("enable_new_feature")
}
