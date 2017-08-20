//
//  ConsoleTarget.swift
//  EXPLogger
//
//  Created by Alex Tereshkov on 8/20/17.
//  Copyright © 2017 Alex Tereshkov. All rights reserved.
//

import Foundation

public class ConsoleTarget: BaseTarget {
    
    override public var defaultHashValue: Int { return 1 }
    
    public override init() {
        super.init()
    }
    
    override public func send(_ level: EXPLogger.LogLevel, msg: String, thread: String, file: String, function: String, line: Int) {
        let formattedLog = formatMessage(level: level, msg: msg, thread: thread, file: file, function: function, line: line)
        
        Swift.print(formattedLog)
    }
    
}
