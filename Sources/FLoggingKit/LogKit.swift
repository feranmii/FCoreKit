//
//  LogginKit.swift
//  FCoreKit
//
//  Created by Feranmi Oladosu on 29/09/2024.
//
import Foundation
import os.log

// MARK: - LogLevel

public enum LogLevel: String {
    case debug = "DEBUG"
    case info = "INFO"
    case warning = "WARNING"
    case error = "ERROR"
}

// MARK: - LogKit

public class LogKit {
    public static let shared = LogKit()
    
    private let logger: OSLog
    
    private init() {
        self.logger = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "com.fer.logkit", category: "default")
    }
    
    public func log(_ message: String, level: LogLevel, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = (file as NSString).lastPathComponent
        let logMessage = "[\(level.rawValue)] [\(fileName):\(line) \(function)] \(message)"
        
        switch level {
        case .debug:
            os_log(.debug, log: logger, "%{public}@", logMessage)
        case .info:
            os_log(.info, log: logger, "%{public}@", logMessage)
        case .warning:
            os_log(.error, log: logger, "%{public}@", logMessage)
        case .error:
            os_log(.fault, log: logger, "%{public}@", logMessage)
        }
        
        #if DEBUG
        print(logMessage)
        #endif
    }
    
    public func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .debug, file: file, function: function, line: line)
    }
    
    public func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .info, file: file, function: function, line: line)
    }
    
    public func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .warning, file: file, function: function, line: line)
    }
    
    public func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .error, file: file, function: function, line: line)
    }
}

// Global functions for easier logging
public func logDebug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    LogKit.shared.log(message, level: .debug, file: file, function: function, line: line)
}

public func logInfo(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    LogKit.shared.log(message, level: .info, file: file, function: function, line: line)
}

public func logWarning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    LogKit.shared.log(message, level: .warning, file: file, function: function, line: line)
}

public func logError(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    LogKit.shared.log(message, level: .error, file: file, function: function, line: line)
}

// Usage example:
// LoggingKit.shared.debug("This is a debug message")
// LoggingKit.shared.error("An error occurred: \(error.localizedDescription)")
