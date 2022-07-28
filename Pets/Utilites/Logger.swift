//
//  DebugLogger.swift
//  Pets
//
//  Created by Seven on 2022/7/14.
//

import Foundation

class Logger {
    static func log(_ item: Any...) {
        #if DEBUG
            Swift.print(item)
        #endif
    }
}
