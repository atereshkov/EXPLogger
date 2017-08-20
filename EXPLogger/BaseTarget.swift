//
//  Destination.swift
//  EXPLogger
//
//  Created by Alex Tereshkov on 8/20/17.
//  Copyright © 2017 Alex Tereshkov. All rights reserved.
//

import Foundation

public class BaseTarget: Hashable {
    
    // custom log message for target
    public struct LogTag {
        public var verbose = "VERBOSE"
        public var debug = "DEBUG"
        public var info = "INFO"
        public var warning = "WARNING"
        public var error = "ERROR"
        public var critical = "CRITICAL"
    }
    
    // custom color for target
    public struct LogColor {
        public var verbose = ""
        public var debug = ""
        public var info = ""
        public var warning = ""
        public var error = ""
        public var critical = ""
    }
    
    // don't log messages which are below this level
    open var minLogLevel = EXPLogger.LogLevel.verbose
    
    // custom output of log tag (info, debug, etc) for target
    open var logTag = LogTag()
    
    // custom color for target
    open var logColor = LogColor()
    var reset = ""
    var escape = ""
    
    private let dateFormatter = DateFormatter()
    open var defaultDateFormat = "HH:mm:ss.SSS"
    open var defaultTimeZone = "" // empty = Current by default
    
    // each target class must have an own hashValue
    lazy public var hashValue: Int = self.defaultHashValue
    open var defaultHashValue: Int { return 0 }
    
    open func send(_ level: EXPLogger.LogLevel, msg: String, thread: String, file: String, function: String, line: Int) {
        
    }
    
    // base formatting for all targets
    func formatMessage(level: EXPLogger.LogLevel, msg: String, thread: String, file: String, function: String, line: Int) -> String {
        // todo add formatting
        var log = ""
        
        log += formatDate() + " "
        log += escape + color(for: level)
        log += tag(for: level) + reset + " "
        log += fileName(of: file, withoutSuffix: true) + "."
        log += function + ":"
        log += String(line) + " - "
        log += msg
        //log += thread
        
        return log
    }
    
    // MARK: Help
    
    func tag(for level: EXPLogger.LogLevel) -> String {
        
        switch level {
        case EXPLogger.LogLevel.verbose:
            return logTag.verbose
        case EXPLogger.LogLevel.debug:
            return logTag.debug
        case EXPLogger.LogLevel.info:
            return logTag.info
        case EXPLogger.LogLevel.warning:
            return logTag.warning
        case EXPLogger.LogLevel.error:
            return logTag.error
        default:
            return logTag.verbose
        }
    }
    
    func formatDate(_ dateFormat: String = "", timeZone: String = "") -> String {
        dateFormatter.dateFormat = dateFormat.isEmpty ? defaultDateFormat : dateFormat
        dateFormatter.timeZone = timeZone.isEmpty ? TimeZone.current : TimeZone(abbreviation: timeZone)
        
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    
    func fileName(of file: String, withoutSuffix: Bool) -> String {
        var filename = ""
        
        let fileParts = file.components(separatedBy: "/")
        if let lastPart = fileParts.last {
            filename = lastPart
        }
        
        if !filename.isEmpty && withoutSuffix {
            let fileNameParts = filename.components(separatedBy: ".")
            if let firstPart = fileNameParts.first {
                filename = firstPart
            }
        }
        
        return filename
    }
    
    
    func color(for level: EXPLogger.LogLevel) -> String {
        var color = ""
        
        switch level {
        case EXPLogger.LogLevel.verbose:
            color = logColor.verbose
        case EXPLogger.LogLevel.debug:
            color = logColor.debug
        case EXPLogger.LogLevel.info:
            color = logColor.info
        case EXPLogger.LogLevel.warning:
            color = logColor.warning
        case EXPLogger.LogLevel.error:
            color = logColor.error
        default:
            color = logColor.verbose
        }
        
        return color
    }
    
}

public func == (lhs: BaseTarget, rhs: BaseTarget) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
